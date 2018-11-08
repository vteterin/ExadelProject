tinymce.init({
    selector: '#info',
    language: 'ru',
    images_upload_url: 'uploadimage',
    file_picker_types: 'image',
    automatic_uploads: true,
    height: 500,
    plugins: [
        'advlist autolink lists link image charmap print preview anchor',
        'searchreplace visualblocks code fullscreen',
        'insertdatetime media table contextmenu paste code'
    ],
    toolbar: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
    file_picker_callback: function (cb, value, meta) {
        var input = document.createElement('input');
        input.setAttribute('type', 'file');
        input.setAttribute('accept', 'image/*');

        input.onchange = function () {
            var file = this.files[0];

            var id = 'blobid' + (new Date()).getTime();
            var blobCache = tinymce.activeEditor.editorUpload.blobCache;
            var blobInfo = blobCache.create(id, file);
            blobCache.add(blobInfo);

            // call the callback and populate the Title field with the file name
            cb(blobInfo.blobUri(), {title: file.name});
        };

        input.click();
    }

});

//on ready...
$(function () {
    var myinput = $('#uploadImageFilePicker');
    var hiddenImageLocationOnServer = $('#articleImage');
    var previewImage = $('#articleImagePreview');

    hiddenImageLocationOnServer.change(function () {
        previewImage.attr('src', this.value);
    });

    previewImage.click(function () {
        myinput.click()
    });

    myinput.change(function () {
        var data = new FormData();
        var file = this.files[0];
        data.append('file', file);
        $.ajax({
            data: data,
            type: 'POST',
            url: 'uploadimage',
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                obj = jQuery.parseJSON(response);
                hiddenImageLocationOnServer.val(obj.location).change();
                console.log('File uploaded');
            },
            error: function () {
                console.log('Unable to upload file...');
            }
        });
    });

});
