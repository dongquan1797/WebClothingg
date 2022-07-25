/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.model;

import java.util.Date;

/**
 *
 * @author Tin
 */
public class Product {
    private int productId;
    private String productName;
    private String description;
    private Date dateOfManufacturer;
    private int categoryId;
    private int manufacturerId;
    private int price;
    private String images;
    Category category;
    Manufacturer manufacturer;

    public Product() {
    }

    public Product(int productId, String productName, String description, Date dateOfManufacturer, int categoryId, int manufacturerId, int price, String images, Category category, Manufacturer manufacturer) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.dateOfManufacturer = dateOfManufacturer;
        this.categoryId = categoryId;
        this.manufacturerId = manufacturerId;
        this.price = price;
        this.images = images;
        this.category = category;
        this.manufacturer = manufacturer;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateOfManufacturer() {
        return dateOfManufacturer;
    }

    public void setDateOfManufacturer(Date dateOfManufacturer) {
        this.dateOfManufacturer = dateOfManufacturer;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getManufacturerId() {
        return manufacturerId;
    }

    public void setManufacturerId(int manufacturerId) {
        this.manufacturerId = manufacturerId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }
    
    
    
}
