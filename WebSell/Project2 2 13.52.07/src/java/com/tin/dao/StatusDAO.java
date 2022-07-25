/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.dao;

import com.tin.model.Status;
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
public class StatusDAO {

    private UtilDB utilDB;

    public UtilDB getUtilDB() {
        return utilDB;
    }

    public void setUtilDB(UtilDB utilDB) {
        this.utilDB = utilDB;
    }

    public StatusDAO() {
        utilDB = new UtilDB();
        utilDB.connect();
    }

    //getbyid
    public Status getById(int id) {
        String sql = "select * from Status where statusID=" + id;
        try {
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                Status s = new Status();
                s.setStatusId(rs.getInt("statusID"));
                s.setStatusName(rs.getString("statusName"));
                return s;
            }
        } catch (Exception e) {
            Logger.getLogger(StatusDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    //insert
    public boolean addNew(Status s) {
        String sql = "insert into Status(statusName) values(?)";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, s.getStatusName());
            int rs = pstm.executeUpdate();
            if (rs != 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(StatusDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //update
    public boolean update(Status s) {
        String sql = "update Status set statusName=? where statusID=?";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, s.getStatusName());
            pstm.setInt(2, s.getStatusId());
            int rs = pstm.executeUpdate();
            if (rs != 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(StatusDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //delete
    public boolean delete(int id) {
        boolean flag = false;
        try {
            String sql1 = "select * from Bill where StatusID="+id;
            Statement stm1 = utilDB.getConn().createStatement();
            ResultSet rs1 = stm1.executeQuery(sql1);
            while (rs1.next()) {
                flag = true;
            }
            if (flag == true) {
                return false;
            } else {
                String sql = "delete from Status where statusID=?";
                try {
                    PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
                    pstm.setInt(1, id);
                    int rs = pstm.executeUpdate();
                } catch (Exception e) {
                    Logger.getLogger(StatusDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        } catch (Exception e) {
            Logger.getLogger(StatusDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return true;
    }
    
    //get all
    public ArrayList<Status> getAll(){
        ArrayList<Status> lst = new ArrayList<>();
        try {
            String sql="select * from Status";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                Status s = new Status();
                s.setStatusId(rs.getInt("statusID"));
                s.setStatusName(rs.getString("statusName"));
                lst.add(s);
            }
        } catch (Exception e) {
            Logger.getLogger(StatusDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }
}
