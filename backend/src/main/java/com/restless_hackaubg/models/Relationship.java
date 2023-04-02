package com.restless_hackaubg.models;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.type.descriptor.sql.TinyIntTypeDescriptor;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "relationship")
public class Relationship {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "relationship_id")
    private Integer id;

    @OneToOne
    @JoinColumn(name = "first_user_id")
    private User firstUser;
    @OneToOne
    @JoinColumn(name = "second_user_id")
    private User secondUser;
    @Column(name = "status_active")
    private Boolean status;

    @Column(name = "start_date")
    @JsonFormat(pattern = "DD:MM:YYYY")
    private LocalDate date;

    public Relationship(User firstUser, User secondUser) {
        this.firstUser = firstUser;
        this.secondUser = secondUser;
        setStatus(true);
        setDate(LocalDate.now());
    }

    public Relationship() {
        setStatus(true);
        setDate(LocalDate.now());
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
