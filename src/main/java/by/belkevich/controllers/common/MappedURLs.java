package by.belkevich.controllers.common;

public abstract class MappedURLs {
    public static final String HOME = "/";
    public static final String CONTACT = "/contact";

    public static final String ARTICLE_GET_FIRST_PAGE = "/articles";
    public static final String ARTICLE_GET_PAGED = "/articles/page/{pagenum}";
    public static final String ARTICLE_BY_ID = "/articles/{id}/";
    public static final String ARTICLE_ADD = "/articles/new";
    public static final String ARTICLE_EDIT = "/articles/{id}/edit";
    public static final String ARTICLE_REMOVE = "/articles/{id}/remove";

    public static final String SEARCH_ARTICLES_BY_CATEGORY = "/articles/category/{name}";
    public static final String SEARCH_ARTICLES_BY_DATECREATED = "articles/datecreated/{dateCreated}";
    public static final String SEARCH_ARTICLES_BY_TAG = "/tag/{name}";
    public static final String UPLOAD_IMAGE = "**/uploadimage";
}
