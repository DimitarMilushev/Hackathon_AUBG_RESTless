package com.restless_hackaubg.models;

import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;
import org.springframework.stereotype.Indexed;

import javax.persistence.*;
//@Getter @Setter
//@AllArgsConstructor
//@NoArgsConstructor
@Entity
@Indexed
@Table(name = "users")
public class User {
    @SortableField
    @NumericField
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    Integer id;
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;
    @Column(name = "email")
    private String email;
    @ManyToOne
    @IndexedEmbedded
    @JoinColumn(name = "gender_id")
    private Genders gender;
    @Field(index = Index.YES, analyze = Analyze.NO, store = Store.NO)
    @NumericField
    @Column(name = "age")
    private Integer age;
    @Column(name = "bio_id")
    @JoinColumn(name = "bio_id", referencedColumnName = "description")
    private String bio;

    @IndexedEmbedded
    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;

    @IndexedEmbedded
    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;

    @IndexedEmbedded
    @ManyToOne
    @JoinColumn(name = "status_id")
    private Status status;

    public User() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Genders getGender() {
        return gender;
    }

    public void setGender(Genders gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
