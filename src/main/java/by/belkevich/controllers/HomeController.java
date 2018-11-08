package by.belkevich.controllers;

import by.belkevich.controllers.common.MappedURLs;
import by.belkevich.controllers.common.MappedViews;
import by.belkevich.entities.Article;
import by.belkevich.entities.Slide;
import by.belkevich.services.ArticlesService;
import by.belkevich.services.CategoryService;
import by.belkevich.services.SlideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    private CategoryService categoryService;
    private ArticlesService articlesService;
    private SlideService slideService;

    @Autowired
    public HomeController(CategoryService categoryService, ArticlesService articlesService, SlideService slideService) {
        this.categoryService = categoryService;
        this.articlesService = articlesService;
        this.slideService = slideService;
    }


    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.HOME)
    public String getHome(Model m, HttpSession session) {

//        List<Category> categories = categoryService.getAll();
//
//
//        if (session.getAttribute("categories") == null) {
//            session.setAttribute("categories", categories);
//        }

//        if (categories.size()>0) {
//            Category category = anyItem(categories);
//            List<Article> recentWithCategory = articlesService.getArticlesByCategoryName(category.getName(), 0, 3);
//            session.setAttribute("recentByCategory",recentWithCategory);
//        }
//
        List<Article> recentArticles = articlesService.getRecentArticles(0, 10);
        m.addAttribute("recentArticles", recentArticles);

        List<Slide> slides = slideService.getAll();
        m.addAttribute("slides", slides);

//        List<Article> randomArticles = ;
//        List<Article> popularArticles = ;
//        List<Article> mostViewed = ;


        return MappedViews.HOME;
    }

    @RequestMapping(method = RequestMethod.GET, value = MappedURLs.CONTACT)
    public String getContactPage() {
        return MappedViews.CONTACT;
    }


}
