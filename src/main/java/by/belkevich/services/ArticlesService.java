package by.belkevich.services;

import by.belkevich.entities.Article;

import java.util.List;

public interface ArticlesService extends Service<Article> {

    void addArticle(Article article, String categoryName);

    void updateArticle(Article article, String categoryName);

    List<Article> getRecentArticles();

    List<Article> getRecentArticles(int offset, int limit);


    List<Article> getArticlesByCategoryName(String name);

    List<Article> getArticlesByCategoryName(String name, int offset, int limit);

    List<Article> getArticlesByCategoryId(Long id);

    List<Article> getArticlesByDateCreated(String dateCreated);

    List<Article> getArticlesByDateCreated(String dateCreated, int offset, int limit);
}
