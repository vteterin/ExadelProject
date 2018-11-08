package by.belkevich.controllers;

import by.belkevich.controllers.common.MappedURLs;
import by.belkevich.controllers.common.MappedViews;
import by.belkevich.entities.Article;
import by.belkevich.services.ArticlesService;
import by.belkevich.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class SearchController {

    private ArticlesService articlesService;
    private CategoryService categoryService;

    @Autowired
    public SearchController(ArticlesService articlesService, CategoryService categoryService) {
        this.articlesService = articlesService;
        this.categoryService = categoryService;
    }

    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.SEARCH_ARTICLES_BY_CATEGORY)
    public String getArticlesByCategory(Model m, @PathVariable("name") String category_name) {
        List<Article> articleList = articlesService.getArticlesByCategoryName(category_name);

        m.addAttribute("articles", articleList);

        return MappedViews.ARTICLES;
    }

    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.SEARCH_ARTICLES_BY_DATECREATED)
    public String getArticlesByDateCreated(Model m, @PathVariable("name") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) String dateCreated) {
        List<Article> articleList = articlesService.getArticlesByDateCreated(dateCreated);

        m.addAttribute("articles", articleList);

        return MappedViews.ARTICLES;
    }
}
