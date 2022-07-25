/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.dao;

import com.tin.model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tin
 */
public class CustomerDAO {

    private UtilDB utildb;

    public CustomerDAO() {
        utildb = new UtilDB();
        utildb.connect();
    }

    public UtilDB getUtildb() {
        return utildb;
    }

    public void setUtildb(UtilDB utildb) {
        this.utildb = utildb;
    }

    //add new 
    public boolean addNew(Customer c) {
        String sql = "insert into Customer(CustomerName, DateOfBirth, Phone, Address, Email, UserName, PassWord) values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement pstm = utildb.getConn().prepareStatement(sql);
            pstm.setString(1, c.getCustomerName());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(c.getDateOfBirth());
            pstm.setString(2, date);
            pstm.setString(3, c.getPhone());
            pstm.setString(4, c.getAddress());
            pstm.setString(5, c.getEmail());
            pstm.setString(6, c.getUsername());
            pstm.setString(7, c.getPassword());
            int result = pstm.executeUpdate();
            if (result != 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;

    }

    //get all
    public ArrayList<Customer> getAll() {
        ArrayList<Customer> list = new ArrayList<>();
        try {
            String sql = "select * from Customer";
            Statement stm = utildb.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Customer c = new Customer();
                c.setCustomerId(rs.getInt("CustomerID"));
                c.setCustomerName(rs.getString("CustomerName"));
                c.setDateOfBirth(rs.getDate("DateOfBirth"));
                c.setPhone(rs.getString("Phone"));
                c.setAddress(rs.getString("Address"));
                c.setEmail(rs.getString("Email"));
                c.setUsername(rs.getString("UserName"));
                c.setPassword(rs.getString("PassWord"));
                list.add(c);
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    //check login user
    public boolean checkLogin(String user, String pass) {
        try {
            String sql = "select * from Customer where UserName=? and PassWord=?";
            PreparedStatement pstm = utildb.getConn().prepareStatement(sql);
            pstm.setString(1, user);
            pstm.setString(2, pass);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //getbyid
    public Customer getById(int id) {
        String sql = "select * from Customer where CustomerID=" + id;
        try {
            Statement stm = utildb.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                Customer c = new Customer();
                c.setCustomerId(rs.getInt("CustomerID"));
                c.setCustomerName(rs.getString("CustomerName"));
                c.setDateOfBirth(rs.getDate("DateOfBirth"));
                c.setPhone(rs.getString("Phone"));
                c.setAddress(rs.getString("Address"));
                c.setEmail(rs.getString("Email"));
                c.setUsername(rs.getString("UserName"));
                c.setPassword(rs.getString("PassWord"));
                return c;
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    //getbyuser
    public Customer getByUserName(String user) {
        try {
            String sql = "select * from Customer where UserName='" + user + "'";
            Statement stm = utildb.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Customer c = new Customer();
                c.setCustomerId(rs.getInt("CustomerID"));
                c.setCustomerName(rs.getString("CustomerName"));
                c.setDateOfBirth(rs.getDate("DateOfBirth"));
                c.setPhone(rs.getString("Phone"));
                c.setAddress(rs.getString("Address"));
                c.setEmail(rs.getString("Email"));
                c.setUsername(rs.getString("UserName"));
                c.setPassword(rs.getString("PassWord"));
                return c;
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    //update
    public boolean update(Customer c) {
        String sql = "update Customer set CustomerName=?, DateOfBirth=?, Phone=?, Address=?, Email=?, UserName=?, PassWord=? where CustomerID=?";
        try {
            PreparedStatement pstm = utildb.getConn().prepareStatement(sql);
            pstm.setString(1, c.getCustomerName());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(2, sdf.format(c.getDateOfBirth()));
            pstm.setString(3, c.getPhone());
            pstm.setString(4, c.getAddress());
            pstm.setString(5, c.getEmail());
            pstm.setString(6, c.getUsername());
            pstm.setString(7, c.getPassword());
            pstm.setInt(8, c.getCustomerId());
            int rs = pstm.executeUpdate();
            if (rs != 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //delete
    public boolean delete(int id) {
        boolean flag = false;
        try {
            String sql1 = "select * from Bill where CustomerID=" + id;
            Statement stm1 = utildb.getConn().createStatement();
            ResultSet rs1 = stm1.executeQuery(sql1);
            while (rs1.next()) {
                flag = true;
            }
            if (flag == true) {
                return false;
            } else {
                String sql = "delete from Customer where CustomerID=?";
                try {
                    PreparedStatement pstm = utildb.getConn().prepareStatement(sql);
                    pstm.setInt(1, id);
                    int rs = pstm.executeUpdate();
                    if (rs != 0) {
                        return true;
                    }
                } catch (Exception e) {
                    Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
}
