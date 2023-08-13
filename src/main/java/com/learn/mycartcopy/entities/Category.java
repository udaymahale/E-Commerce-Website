/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.mycartcopy.entities;
import javax.persistence.*;
import java.util.*;
import javax.persistence.Entity;
/**
 *
 * @author ROHIT
 */
@Entity
public class Category {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTittle;
    private String categoryDescription;
    @OneToMany(mappedBy ="category")
    private List<Product> products =new ArrayList<>(); 

    public Category() {
    }

    public Category(int categoryId, String categoryTit, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryTittle = categoryTit;
        this.categoryDescription = categoryDescription;
    }

    public Category(String categoryTit, String categoryDescription,List<Product> products) {
        this.categoryTittle = categoryTit;
        this.categoryDescription = categoryDescription;
        this.products= products;
    }

    
    
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTit() {
        return categoryTittle;
    }

    public void setCategoryTit(String categoryTit) {
        this.categoryTittle = categoryTit;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTit=" + categoryTittle + ", categoryDescription=" + categoryDescription + '}';
    }
    
    
}
