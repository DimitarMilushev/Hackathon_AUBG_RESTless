package com.restless_hackaubg.models;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.NumericField;
import org.springframework.stereotype.Indexed;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Indexed
@Table(name = "cities")
public class City {
    @Id
    @NumericField
    @Column(name = "city_id")
    private Integer id;

    @Field
    @Column(name = "name")
    private String name;

    public City() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
