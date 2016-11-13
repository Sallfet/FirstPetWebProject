package com.spring.model;


import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name="Users")
public class User {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="name")
    private String name;

    @Column(name="age")
    private int age;

    @Type(type = "numeric_boolean")
    @Column(name="admin")
    private boolean admin;

    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;


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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.admin = isAdmin;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getEdit()
    {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("<a href=\"/edit/" + this.getId() + "\">Edit</a>");
       return  new String(stringBuilder);
    }

    public String getDelete()
    {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("<a href=\"/remove/" + this.getId() + "\">Delete</a>");
        return  new String(stringBuilder);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", isAdmin="  + admin +
                ", startTime="  +
                '}';
    }
}