package by.belkevich.services;

import by.belkevich.entities.Article;
import by.belkevich.entities.Category;
import by.belkevich.repository.RepositoryJPAImpl;
import by.belkevich.services.util.ParametersBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Service
public class ArticlesServiceImpl extends ParentService <Article> implements ArticlesService  {

    private CategoryService categoryService;

    @Autowired
    public ArticlesServiceImpl(RepositoryJPAImpl<Article, Long> repositoryJPA,
                               CategoryService categoryService) {
        super(repositoryJPA);
        this.categoryService = categoryService;
    }

    @Transactional
    public void addArticle(Article article, String categoryName) {
        Category category = categoryService.getCategoryByName(categoryName);
        article.setCategory(category);
        repositoryJPA.add(article);
    }

    @Transactional
    public void updateArticle(Article article, String categoryName) {
        Category category = categoryService.getCategoryByName(categoryName);
        article.setCategory(category);
        repositoryJPA.update(article);
    }

    @Override
    @Transactional
    public List<Article> getArticlesByCategoryName(String name) {
        return repositoryJPA.getAllByNamedQuery("ARTICLE.GET_BY_CATEGORYNAME", ParametersBuilder.newBuilder().addParam("category_name",name).build());
    }

    @Override
    @Transactional
    public List<Article> getArticlesByCategoryName(String name, int offset, int limit) {
        return repositoryJPA
                .getAllByNamedQuery("ARTICLE.GET_BY_CATEGORYNAME",
                        ParametersBuilder.newBuilder().addParam("category_name", name).build(),
                        offset,
                        limit);
    }

    @Override
    @Transactional
    public List<Article> getArticlesByDateCreated(String dateCreated, int offset, int limit) {
        return repositoryJPA
                .getAllByNamedQuery("ARTICLE.GET_BY_DATECREATED",
                        ParametersBuilder.newBuilder().addParam("dateCreated", dateCreated).build(),
                        offset,
                        limit);
    }

    @Override
    @Transactional
    public List<Article> getArticlesByDateCreated(String dateCreated) {
        return repositoryJPA
                .getAllByNamedQuery("ARTICLE.GET_BY_DATECREATED",
                        ParametersBuilder.newBuilder().addParam("dateCreated", dateCreated).build());
    }


    @Override
    @Transactional
    public List<Article> getArticlesByCategoryId(Long id) {
        return repositoryJPA.getAllByNamedQuery("ARTICLE.GET_BY_CATEGORYID", ParametersBuilder.newBuilder().addParam("category_id", id).build());
    }

    @Override
    @Transactional
    public List<Article> getRecentArticles() {
        return this.repositoryJPA.getAllByNamedQuery("ARTICLE.GET_LAST", Collections.emptyMap());
    }

    @Override
    @Transactional
    public List<Article> getRecentArticles(int offset, int limit) {
        return this.repositoryJPA.getAllByNamedQuery("ARTICLE.GET_LAST", Collections.emptyMap(), offset, limit);
    }
}
