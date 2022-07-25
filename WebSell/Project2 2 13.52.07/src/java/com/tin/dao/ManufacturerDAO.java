/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.dao;

import com.tin.model.Manufacturer;
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
public class ManufacturerDAO {

    private UtilDB utilDB;

    public ManufacturerDAO() {
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
    public Manufacturer getById(int id) {
        String sql = "select * from Manufacturer where manufacturerID=" + id;
        try {
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                Manufacturer m = new Manufacturer();
                m.setManufacturerId(rs.getInt("manufacturerID"));
                m.setManufacturerName(rs.getString("manufacturerName"));
                m.setNationId(rs.getInt("nationID"));
                NationDAO na = new NationDAO();
                m.setNation(na.getById(m.getNationId()));
                return m;
            }
        } catch (Exception e) {
            Logger.getLogger(ManufacturerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    //get all
    public ArrayList<Manufacturer> getAll() {
        ArrayList<Manufacturer> lst = new ArrayList<>();
        try {
            String sql = "select * from Manufacturer";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Manufacturer m = new Manufacturer();
                m.setManufacturerId(rs.getInt("manufacturerID"));
                m.setManufacturerName(rs.getString("manufacturerName"));
                m.setNationId(rs.getInt("nationID"));
                NationDAO na = new NationDAO();
                m.setNation(na.getById(m.getNationId()));
                lst.add(m);
            }
        } catch (Exception e) {
            Logger.getLogger(ManufacturerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }

    //update
    public boolean update(Manufacturer m) {
        String sql = "update Manufacturer set manufacturerName=?, nationID=? where manufacturerID=?";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, m.getManufacturerName());
            pstm.setInt(2, m.getNationId());
            pstm.setInt(3, m.getManufacturerId());
            int rs = pstm.executeUpdate();
            if (rs != 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(ManufacturerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //delete
    public boolean delete(int id) {
        boolean flag = false;
        try {
            String sql1 = "select * from Product where ManufacturerID=" + id;
            Statement stm1 = utilDB.getConn().createStatement();
            ResultSet rs1 = stm1.executeQuery(sql1);
            while (rs1.next()) {
                flag = true;
            }
            if (flag == true) {
                return false;
            } else {
                try {
                    String sql = "delete from Manufacturer where manufacturerID=?";
                    PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
                    pstm.setInt(1, id);
                    int rs = pstm.executeUpdate();
                    if (rs != 0) {
                        return true;
                    }
                } catch (Exception e) {
                    Logger.getLogger(ManufacturerDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        } catch (Exception e) {
            Logger.getLogger(ManufacturerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //get new pro
    public ArrayList<Manufacturer> getNewManufacturer(int number) {
        ArrayList<Manufacturer> lst = new ArrayList<>();
        try {
            String sql = "select top " + number + " * from Manufacturer order by manufacturerID desc";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Manufacturer ma = new Manufacturer();
                ma.setManufacturerId(rs.getInt("manufacturerID"));
                ma.setManufacturerName(rs.getString("manufacturerName"));
                ma.setNationId(rs.getInt("nationID"));
                NationDAO na = new NationDAO();
                ma.setNation(na.getById(ma.getNationId()));
                lst.add(ma);
            }
        } catch (Exception e) {
            Logger.getLogger(ManufacturerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }

    //get by nationid
    public ArrayList<Manufacturer> getByNation(int naID) {
        ArrayList<Manufacturer> lst = new ArrayList<>();
        try {
            String sql = "select * from Manufacturer where nationID=" + naID + " order by manufacturerID desc";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Manufacturer ma = new Manufacturer();
                ma.setManufacturerId(rs.getInt("manufacturerID"));
                ma.setManufacturerName(rs.getString("manufacturerName"));
                ma.setNationId(rs.getInt("nationID"));
                NationDAO na = new NationDAO();
                ma.setNation(na.getById(ma.getNationId()));
                lst.add(ma);
            }
        } catch (Exception e) {
            Logger.getLogger(ManufacturerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }

    //add new
    public boolean Addnew(Manufacturer m) {
        String sql = "insert into Manufacturer(manufacturerName, nationID) values(?,?)";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, m.getManufacturerName());
            pstm.setInt(2, m.getNationId());
            int rs = pstm.executeUpdate();
            if(rs!=0) return true;
        } catch (Exception e) {
            Logger.getLogger(ManufacturerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
}
