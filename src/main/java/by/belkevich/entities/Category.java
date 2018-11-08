package by.belkevich.entities;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="category")
@NamedQueries({
        @NamedQuery(name = "GET_CATEGORY_BY_NAME",
                query = "FROM Category c WHERE c.name = :category_name")
})

public class Category extends ParentEntity {

    private static final long serialVersionUID = -5762036796842765758L;

    @Column(name="name", nullable = false)
    private String name;


    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private Set<Article> articles;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
