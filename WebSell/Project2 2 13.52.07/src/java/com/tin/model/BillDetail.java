/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.model;

/**
 *
 * @author Tin
 */
public class BillDetail {
    private int billId;
    private int productId;
    private int quantity;
    Bill bill;
    Product product;

    public BillDetail() {
    }

    public BillDetail(int billId, int productId, int quantity, Bill bill, Product product) {
        this.billId = billId;
        this.productId = productId;
        this.quantity = quantity;
        this.bill = bill;
        this.product = product;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    
}
