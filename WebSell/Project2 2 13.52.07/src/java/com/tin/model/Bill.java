/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.model;

import java.util.Date;
import java.util.ArrayList;

/**
 *
 * @author Tin
 */
public class Bill {
    private int billId;
    private Date billDate;
    private int customerId;
    private int staffId;
    private int statusId;
    Customer customer;
    Staff staff;
    Status status;
    
    private ArrayList<BillDetail> lstBillDetail;

    public Bill() {
    }

    public Bill(int billId, Date billDate, int customerId, int staffId, int statusId, Customer customer, Staff staff, Status status) {
        this.billId = billId;
        this.billDate = billDate;
        this.customerId = customerId;
        this.staffId = staffId;
        this.statusId = statusId;
        this.customer = customer;
        this.staff = staff;
        this.status = status;
    }

    public ArrayList<BillDetail> getLstBillDetail() {
        return lstBillDetail;
    }

    public void setLstBillDetail(ArrayList<BillDetail> lstBillDetail) {
        this.lstBillDetail = lstBillDetail;
    }
    
    
    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
    
    
}
