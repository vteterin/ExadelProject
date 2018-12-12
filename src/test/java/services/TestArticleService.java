package services;

import by.belkevich.entities.Article;
import by.belkevich.entities.Category;
import by.belkevich.services.ArticlesService;
import by.belkevich.services.CategoryService;
import config.TestJPAConfig;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {TestJPAConfig.class})
@WebAppConfiguration
@Transactional
public class TestArticleService {

    private static final Logger logger = Logger.getLogger(TestArticleService.class);

    @Autowired
    private ArticlesService articlesService;

    @Autowired
    private CategoryService categoryService;

    private static Category category;
    private static Category category2;

    @Before
    public void setUp() {

        category = new Category();
        category.setName("Sample Category Name");
        categoryService.add(category);

        category2 = new Category();
        category2.setName("TestCategory");
        categoryService.add(category2);
    }

    @Test
    public void testArticleAdd() {

        Article article = new Article();
        article.setTitle("Sample title");
        article.setInfo("test info");
        article.setPreview("Sample preview");
        article.setCategory(category);

        articlesService.add(article);

        assertTrue(article.getTitle() + " is saved - Id " + article.getId(), article.getId() > 0);
    }


    @Test
    public void testArticleGet() {
        Article article = new Article();
        article.setTitle("Sample title");
        article.setInfo("test info");
        article.setPreview("Sample preview");
        article.setCategory(category);
        articlesService.add(article);

        Article gettedArticle = articlesService.get(article.getId());

        assertEquals("Stored and getted ArticleID are not equal", article.getId(), gettedArticle.getId());
    }

    @Test
    public void testArticleUpdate() {
        Article article = new Article();
        article.setTitle("Sample title");
        article.setInfo("test info");
        article.setPreview("Sample preview");
        article.setCategory(category);
        articlesService.add(article);

        article.setInfo("New Info");

        articlesService.update(article);

        Article updatedArticle = articlesService.get(article.getId());

        assertEquals("Loaded info are not equal to updated info.", updatedArticle.getInfo(), article.getInfo());
    }

    @Test
    public void testArticleDelete() {
        Article article = new Article();
        article.setTitle("Sample title");
        article.setInfo("test info");
        article.setPreview("Sample preview");
        article.setCategory(category);
        articlesService.add(article);

        articlesService.deleteInTransaction(article);

        Article removedArticle = articlesService.get(article.getId());

        assertNull("Object are not removed from storage", removedArticle);
    }


    @Test
    public void testGetAll() {

        List<String> expectedTitles = new ArrayList<>(3);

        for (int i = 0; i < 3; i++) {
            Article article = new Article();
            article.setTitle("Sample title #" + i);
            article.setInfo("test info");
            article.setPreview("Sample preview");
            article.setCategory(category);
            articlesService.add(article);
            expectedTitles.add(article.getTitle());
        }

        List<String> actualTitles = articlesService.getAll().stream().map(Article::getTitle).collect(Collectors.toList());

        assertThat("Actual List of titles are not equals expected", actualTitles, is(expectedTitles));
    }

    @Test
    public void testGetAllByCategory() {

        List<String> expectedTitles = new ArrayList<>(3);

        for (int i = 0; i < 3; i++) {
            Article article = new Article();
            article.setTitle("Sample title #" + i);
            article.setInfo("test info");
            article.setPreview("Sample preview");
            if (i%2==0) {
                article.setCategory(category);
            }else{
                article.setCategory(category2);
                expectedTitles.add(article.getTitle());
            }
            articlesService.add(article);
        }

        List<String> actualTitles = articlesService.getArticlesByCategoryName(category2.getName()).stream().map(Article::getTitle).collect(Collectors.toList());

        assertThat("Actual List of titles with specified category are not equal to expected", actualTitles, is(expectedTitles));
    }
}
