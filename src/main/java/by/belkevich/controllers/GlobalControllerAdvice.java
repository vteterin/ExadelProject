package by.belkevich.controllers;

import by.belkevich.entities.Article;
import by.belkevich.entities.Category;
import by.belkevich.services.ArticlesService;
import by.belkevich.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Collections;
import java.util.List;
import java.util.Random;

@ControllerAdvice
public class GlobalControllerAdvice {

    private ArticlesService articlesService;
    private CategoryService categoryService;
    private Random randomizer;

    @Autowired
    public GlobalControllerAdvice(ArticlesService articlesService, CategoryService categoryService) {
        this.articlesService = articlesService;
        this.categoryService = categoryService;
        this.randomizer = new Random();
    }

    @ModelAttribute("categories")
    public List<Category> getCategories() {
        return categoryService.getAll();
    }


    private <T> T anyItem(List<T> items) {
        if (items != null && items.size() > 0) {
            int index = this.randomizer.nextInt(items.size());
            return items.get(index);
        }
        return null;
    }

    @ModelAttribute("recentByCategory")
    public List<Article> getRecentByCategory() {
        List<Category> categories = categoryService.getAll();
        if (categories.size() > 0) {
            Category category = anyItem(categories);
            return articlesService.getArticlesByCategoryName(category.getName(), 0, 3);
        } else {
            return Collections.emptyList();
        }
    }

}
