/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.dao;

import com.tin.model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tin
 */
public class NationDAO {

    private UtilDB utilDB;

    public NationDAO() {
        utilDB = new UtilDB();
        utilDB.connect();
    }

    public UtilDB getUtilDB() {
        return utilDB;
    }

    public void setUtilDB(UtilDB utilDB) {
        this.utilDB = utilDB;
    }

    //get by id
    public Nation getById(int id) {
        String sql = "select * from Nation where nationID=" + id;
        try {
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                Nation n = new Nation();
                n.setNationId(rs.getInt("nationID"));
                n.setNationName(rs.getString("nationName"));
                return n;
            }
        } catch (Exception e) {
            Logger.getLogger(NationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    //get all
    public ArrayList<Nation> getAll() {
        ArrayList<Nation> lst = new ArrayList<>();
        try {
            String sql = "select * from Nation";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Nation n = new Nation();
                n.setNationId(rs.getInt("nationID"));
                n.setNationName(rs.getString("nationName"));
                lst.add(n);
            }
        } catch (Exception e) {
            Logger.getLogger(NationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }

    //add new
    public boolean addNew(Nation n) {
        String sql = "insert into Nation(nationName) values(?)";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, n.getNationName());
            int rs = pstm.executeUpdate();
            if(rs!=0) return true;
        } catch (Exception e) {
            Logger.getLogger(NationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
    //update
    public boolean update(Nation n){
        String sql="update Nation set nationName=? where nationID=?";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, n.getNationName());
            pstm.setInt(2, n.getNationId());
            int rs = pstm.executeUpdate();
            if(rs!=0) return true;
        } catch (Exception e) {
            Logger.getLogger(NationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
    //delete
    public boolean delete(int id){
        boolean flag = false;
        try {
            String sql1="select * from Manufacturer where nationID="+id;
            Statement stm1 = utilDB.getConn().createStatement();
            ResultSet rs1 =stm1.executeQuery(sql1);
            while(rs1.next()) flag=true;
            if(flag==true){
                return false;
            }else{
                String sql="delete from Nation where nationID=?";
                try {
                    PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
                    pstm.setInt(1, id);
                    int rs = pstm.executeUpdate();
                    if(rs!=0) return true;
                } catch (Exception e) {
                    Logger.getLogger(NationDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            } 
        } catch (Exception e) {
            Logger.getLogger(NationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
}
