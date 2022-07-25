/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.dao;

import com.tin.model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tin
 */
public class CategoryDAO {

    private UtilDB utilDB;

    public UtilDB getUtilDB() {
        return utilDB;
    }

    public void setUtilDB(UtilDB utilDB) {
        this.utilDB = utilDB;
    }

    public CategoryDAO() {
        utilDB = new UtilDB();
        utilDB.connect();
    }

    //add new
    public boolean addNew(Category c) {
        String sql = "insert into Category(categoryName) values(?)";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareCall(sql);
            pstm.setString(1, c.getCategoryName());
            int result = pstm.executeUpdate();
            if (result != 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //update
    public boolean update(Category c) {
        String sql = "update Category set categoryName=? where categoryID=?";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareCall(sql);
            pstm.setString(1, c.getCategoryName());
            pstm.setInt(2, c.getCategoryID());
            int result = pstm.executeUpdate();
            if (result != 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //delete
    public boolean delete(int id) {
        boolean flag=false;
        try {
            String sql = "select * from Product where CategoryID=" + id;
            Statement stm1 = utilDB.getConn().createStatement();
            ResultSet rs = stm1.executeQuery(sql);
            while (rs.next()) {
                flag=true;
            }
            if(flag==true){
                return false;
            }else{
                String sql1="delete from Category where categoryID=?";
                try {
                    PreparedStatement pst=utilDB.getConn().prepareStatement(sql1);
                    pst.setInt(1, id);
                    int result=pst.executeUpdate();
                    if(result!=0) return true;
                } catch (Exception e) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        } catch (Exception e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //get all
    public ArrayList<Category> getAll() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "select * from Category";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                list.add(c);
            }
        } catch (Exception e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    
    //get by id
    public Category getById(int id){
        String sql="select * from Category where categoryID="+id;
        try {
            Statement stm= utilDB.getConn().createStatement();
            ResultSet rs =stm.executeQuery(sql);
            if(rs.next()){
                Category ca = new Category();
                ca.setCategoryID(rs.getInt("categoryID"));
                ca.setCategoryName(rs.getString("categoryName"));
                return ca;
            }
        } catch (Exception e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

}
