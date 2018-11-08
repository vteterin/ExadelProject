package by.belkevich.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "article")
@NamedQueries({
        @NamedQuery(
                name = "ARTICLE.GET_LAST",
                query = "FROM Article AS a ORDER BY a.dateCreated DESC"
        ),
        @NamedQuery(
                name = "ARTICLE.GET_BY_CATEGORYNAME",
                query = "FROM Article AS a WHERE a.category.name = :category_name ORDER BY a.dateCreated DESC"
        ),
        @NamedQuery(
                name = "ARTICLE.GET_BY_CATEGORYID",
                query = "FROM Article AS a WHERE a.category.id = :category_id ORDER BY a.dateCreated DESC"
        ),
        @NamedQuery(
                name = "ARTICLE.GET_BY_DATECREATED",
                query = "FROM Article AS a WHERE a.dateCreated = :dateCreated ORDER BY a.dateCreated DESC"
        )}

)
public class Article extends ParentEntity {

    private static final long serialVersionUID = -2201622758608654410L;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false, columnDefinition = "text")
    private String preview;

    @Column(nullable = false, columnDefinition = "text")
    private String info;

    @Column(length = 100, name = "articleimage")
    private String articleImage;

    @Column(name = "datecreated",
            updatable = false,
            insertable = false,
    columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;

    @ManyToOne
    @JoinColumn(name="category_id")
    private Category category;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPreview() {
        return preview;
    }

    public void setPreview(String preview) {
        this.preview = preview;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getArticleImage() {
        return articleImage;
    }

    public void setArticleImage(String articleImage) {
        this.articleImage = articleImage;
    }
}
