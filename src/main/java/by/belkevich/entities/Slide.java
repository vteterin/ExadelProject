package by.belkevich.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "slide")
public class Slide extends ParentEntity {

    private static final long serialVersionUID = 183892483910505764L;

    @Column(name = "slideimage", nullable = false)
    private String slideimage;

    @Column(name = "link")
    private String link;

    @Column(name = "maintitle")
    private String mainTitle;

    @Column(name = "subtitle")
    private String subTitle;

    public Slide(String slideimage, String link, String mainTitle, String subTitle) {
        this.slideimage = slideimage;
        this.link = link;
        this.mainTitle = mainTitle;
        this.subTitle = subTitle;
    }

    public Slide() {
    }

    public String getSlideimage() {
        return slideimage;
    }

    public void setSlideimage(String slideimage) {
        this.slideimage = slideimage;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getMainTitle() {
        return mainTitle;
    }

    public void setMainTitle(String mainTitle) {
        this.mainTitle = mainTitle;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }
}
