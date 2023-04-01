package com.restless_hackaubg.models;



import org.hibernate.search.annotations.Field;
import org.springframework.stereotype.Indexed;

import javax.persistence.*;

//@Getter @Setter
//@NoArgsConstructor
//@AllArgsConstructor
@Entity
@Indexed
@Table(name = "genders")
public class Genders{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "gender_id")
    private int id;

    @Field
    @Column(name = "name")
    private String name;

    public Genders() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
