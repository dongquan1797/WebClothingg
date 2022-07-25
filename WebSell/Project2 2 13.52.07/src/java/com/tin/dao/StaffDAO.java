/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.dao;

import com.tin.model.Staff;
import java.sql.Array;
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
public class StaffDAO {
    private UtilDB utilDB;

    public UtilDB getUtilDB() {
        return utilDB;
    }

    public void setUtilDB(UtilDB utilDB) {
        this.utilDB = utilDB;
    }

    public StaffDAO() {
        utilDB = new UtilDB();
        utilDB.connect();
    }
    
    //getById
    public Staff getById(int id){
        String sql="select * from Staff where staffid="+id;
        try {
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs.next()){
                Staff s = new Staff();
                s.setStaffId(rs.getInt("staffid"));
                s.setFullName(rs.getString("fullname"));
                s.setDateOfBirth(rs.getDate("dateofbirth"));
                s.setGender(rs.getBoolean("gender"));
                s.setAddress(rs.getString("address"));
                s.setPhone(rs.getString("phone"));
                s.setUserName(rs.getString("username"));
                s.setPassWord(rs.getString("password"));
                s.setAdmin(rs.getBoolean("admin"));
                return s;
            }
        } catch (Exception e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    
    //check login
    public Staff checkLogin(String user, String pass){
        try {
            String sql="select * from Staff where username=? and password=?";
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, user);
            pstm.setString(2, pass);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                Staff s = new Staff();
                s.setStaffId(rs.getInt("staffid"));
                s.setFullName(rs.getString("fullname"));
                s.setDateOfBirth(rs.getDate("dateofbirth"));
                s.setGender(rs.getBoolean("gender"));
                s.setAddress(rs.getString("address"));
                s.setPhone(rs.getString("phone"));
                s.setUserName(rs.getString("username"));
                s.setPassWord(rs.getString("password"));
                s.setAdmin(rs.getBoolean("admin"));
                return s;                
            }
        } catch (Exception e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null; 
    }
    
    //getall
    public ArrayList<Staff> getAll(){
        ArrayList<Staff> lst = new ArrayList<>();
        try {
            String sql="select * from Staff";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                 Staff s = new Staff();
                s.setStaffId(rs.getInt("staffid"));
                s.setFullName(rs.getString("fullname"));
                s.setDateOfBirth(rs.getDate("dateofbirth"));
                s.setGender(rs.getBoolean("gender"));
                s.setAddress(rs.getString("address"));
                s.setPhone(rs.getString("phone"));
                s.setUserName(rs.getString("username"));
                s.setPassWord(rs.getString("password"));
                s.setAdmin(rs.getBoolean("admin"));
                lst.add(s);
            }
        } catch (Exception e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }
    
    //insert
    public boolean addNew(Staff s){
        String sql="insert into Staff(fullname, dateofbirth, gender, address, phone, username, password, admin) values(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, s.getFullName());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(2, sdf.format(s.getDateOfBirth()));
            pstm.setBoolean(3, s.isGender());
            pstm.setString(4, s.getAddress());
            pstm.setString(5, s.getPhone());
            pstm.setString(6, s.getUserName());
            pstm.setString(7, s.getPassWord());
            pstm.setBoolean(8, s.isAdmin());
            int rs = pstm.executeUpdate();            
            if(rs!=0) return true;
        } catch (Exception e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
    //update
    public boolean update(Staff s){
        String sql="update Staff set fullname=?, dateofbirth=?, gender=?, address=?, phone=?, username=?, password=?, admin=? where staffid=?";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
             pstm.setString(1, s.getFullName());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(2, sdf.format(s.getDateOfBirth()));
            pstm.setBoolean(3, s.isGender());
            pstm.setString(4, s.getAddress());
            pstm.setString(5, s.getPhone());
            pstm.setString(6, s.getUserName());
            pstm.setString(7, s.getPassWord());
            pstm.setBoolean(8, s.isAdmin());
            pstm.setInt(9, s.getStaffId());
            int rs = pstm.executeUpdate();
            if(rs!=0) return true;
        } catch (Exception e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
    //delete
    public boolean delete(int id){
        boolean flag=false;
        try {
            String sql1="select * from Bill where StaffID="+id;
            Statement stm1 = utilDB.getConn().createStatement();
            ResultSet rs1 = stm1.executeQuery(sql1);
            while(rs1.next()) flag=true;
            if(flag==true) {
                return false;
            } else{
                String sql = "delete from Staff where staffid=?";
                try {
                    PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
                    pstm.setInt(1, id);
                    int rs = pstm.executeUpdate();
                    if(rs!=0) return true;
                } catch (Exception e) {
                    Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        } catch (Exception e) {
            Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
}
