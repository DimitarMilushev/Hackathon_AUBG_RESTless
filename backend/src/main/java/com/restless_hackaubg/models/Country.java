package com.restless_hackaubg.models;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.NumericField;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "countries")
@Indexed
public class Country {
    @Id
    @NumericField
    @Column(name = "country_id")
    private Integer id;

    @Field
    @Column(name = "name")
    private String name;

    public Country() {
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
