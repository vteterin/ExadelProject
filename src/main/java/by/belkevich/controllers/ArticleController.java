package by.belkevich.controllers;

import by.belkevich.controllers.common.MappedURLs;
import by.belkevich.controllers.common.MappedViews;
import by.belkevich.entities.Article;
import by.belkevich.services.ArticlesService;
import org.apache.commons.io.FilenameUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes("article")
public class ArticleController {


    private ArticlesService articlesService;

    //TODO:Gather this value from properties file
    private static final int ARTICLES_PER_PAGE = 1;


    private ServletContext servletContext;
    private static final String UPLOAD_FOLDER = "/resources/uploaded-images/";

    @Autowired
    public ArticleController(ArticlesService articlesService, ServletContext servletContext) {
        this.articlesService = articlesService;
        this.servletContext = servletContext;
    }

    //TODO:Repalce id with more SEO optimized form like title on english
    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.ARTICLE_BY_ID)
    public String viewArticle(Model m, @PathVariable("id") Long articleId) {
        Article article = articlesService.getInTransaction(articleId);

        m.addAttribute("article", article);

        return MappedViews.ARTICLE_VIEW;
    }

    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.ARTICLE_GET_FIRST_PAGE)
    public String viewAllArticles(Model m) {
        return viewAllArticles(m, 1);
    }

    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.ARTICLE_GET_PAGED)
    public String viewAllArticles(Model m, @PathVariable("pagenum") int pageNum) {
        if (pageNum <= 0)
            pageNum = 1;

        int articleCount = articlesService.getCount();
        int pageCount = (articleCount - 1) / ARTICLES_PER_PAGE + 1;

        if (pageNum > pageCount)
            pageNum = pageCount;

        List<Article> articles = articlesService.getAllLimit((pageNum - 1) * ARTICLES_PER_PAGE, ARTICLES_PER_PAGE);

        m.addAttribute("articles", articles);
        m.addAttribute("pageCount", pageCount);
        m.addAttribute("currentPage", pageNum);
        m.addAttribute("baseUrl", MappedURLs.ARTICLE_GET_FIRST_PAGE);

        return MappedViews.ARTICLES;
    }

    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.ARTICLE_ADD)
    public String createNewArticle(Model m) {
        m.addAttribute("article", getEmptyArticle());
        return MappedViews.ARTICLE_ADD_EDIT;
    }

    @RequestMapping(method = RequestMethod.POST, value = MappedURLs.ARTICLE_ADD)
    public String postNewArticle(
            @ModelAttribute("article") Article article,
            @RequestParam(value = "categoryName", defaultValue = "") String categoryName,
            SessionStatus status) {
        articlesService.addArticle(article, categoryName);
        status.setComplete();
        return "redirect:/articles/" + article.getId();
    }

    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.ARTICLE_EDIT)
    public String editArticle(Model m, @PathVariable("id") Long id) {
        Article article = articlesService.getInTransaction(id);
        m.addAttribute("article", article);
        return MappedViews.ARTICLE_ADD_EDIT;
    }

    @RequestMapping(method = RequestMethod.POST, value = MappedURLs.ARTICLE_EDIT)
    public String editArticle(Model m,
                              @ModelAttribute("article") Article article,
                              @RequestParam("categoryName") String categoryName,
                              SessionStatus status) {

        articlesService.updateArticle(article, categoryName);
        status.setComplete();
        return "redirect:/articles/" + article.getId();
    }


    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.ARTICLE_REMOVE)
    public String removeArticle(@PathVariable("id") Long id) {

        articlesService.deleteByIdInTransaction(id);

        return "redirect:" + MappedURLs.ARTICLE_GET_FIRST_PAGE;
    }

    @RequestMapping(method = RequestMethod.POST, value = MappedURLs.UPLOAD_IMAGE)
    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile multipartFile) throws IOException {

        //TODO:Check for content type of file...
        if (!multipartFile.isEmpty()) {
            try {

                SimpleDateFormat createTempFile = new SimpleDateFormat("ddMMyy");
                String imageName = "image-" + createTempFile.format(new Date()) + "-";
                String webappRoot = servletContext.getRealPath("/");
                File uploadImagesDir = new File(Paths.get(webappRoot, UPLOAD_FOLDER).toString());
                if (uploadImagesDir.exists() || uploadImagesDir.mkdirs()) {
                    File savedFile = File.createTempFile(imageName, "." + FilenameUtils.getExtension(multipartFile.getOriginalFilename()), uploadImagesDir);
                    multipartFile.transferTo(savedFile);

                    JSONObject json = new JSONObject();
                    json.put("location", UPLOAD_FOLDER + savedFile.getName());
                    return ResponseEntity.ok(json.toJSONString());
                } else {
                    throw new IOException("Unable to create path for storing images.");
                }
            } catch (Exception e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("");
            }
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("");
    }


    @ModelAttribute("article")
    public Article getEmptyArticle() {
        return new Article();
    }
}
