package by.belkevich.entities;

import javax.persistence.*;
import java.io.Serializable;

@MappedSuperclass
abstract class ParentEntity implements Serializable{

    private static final long serialVersionUID = 963424289197697369L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false, updatable = false)
    private Long id;


    public Long getId() {
        return id;
    }
}
