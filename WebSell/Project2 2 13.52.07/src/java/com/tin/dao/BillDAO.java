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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tin
 */
public class BillDAO {

    private UtilDB utilDB;

    public UtilDB getUtilDB() {
        return utilDB;
    }

    public void setUtilDB(UtilDB utilDB) {
        this.utilDB = utilDB;
    }

    public BillDAO() {
        utilDB = new UtilDB();
        utilDB.connect();
    }

    //add new
    public boolean addNew(Bill b) {
        String sql = "insert into Bill(BillDate, CustomerID, StatusID) values(?,?,?)";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            String date = new SimpleDateFormat("yyyy-MM-dd").format(b.getBillDate());
            pstm.setString(1, date);
            pstm.setInt(2, b.getCustomerId());
            pstm.setInt(3, b.getStatusId());
            int rs = pstm.executeUpdate();
            if (rs != 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //update
    public boolean update(Bill b) {
        String sql = "update Bill set BillDate=?, CustomerID=?, StaffID=?, StatusID=? where BillID=?";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            String date = new SimpleDateFormat("yyyy-MM-dd").format(b.getBillDate());
            pstm.setString(1, date);
            pstm.setInt(2, b.getCustomerId());
            pstm.setInt(3, b.getStaffId());
            pstm.setInt(4, b.getStatusId());
            pstm.setInt(5, b.getBillId());
            int rs = pstm.executeUpdate();
            if (rs != 0) {
                return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    //delete
    public boolean delete(Bill b) {
        try {
            String sql1 = "delete from BillDetail where BillID=" + b.getBillId();
            Statement stm1 = utilDB.getConn().createStatement();
            int rs1 = stm1.executeUpdate(sql1);
            if (rs1 < 1) {
                return false;
            } else {
                String sql = "delete from Bill where BillID=?";
                try {
                    PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
                    pstm.setInt(1, b.getBillId());
                    int rs = pstm.executeUpdate();
                    if (rs != 0) {
                        return true;
                    }
                } catch (Exception e) {
                    Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    //get new bill
    public Bill getNewBill() {
        String sql = "select top 1 * from Bill order by BillID desc";
        try {
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                Bill b = new Bill();
                b.setBillId(rs.getInt("BillID"));
                b.setBillDate(rs.getDate("BillDate"));
                b.setCustomerId(rs.getInt("CustomerID"));
                b.setStaffId(rs.getInt("StaffID"));
                b.setStatusId(rs.getInt("StatusID"));
                CustomerDAO cusDAO = new CustomerDAO();
                b.setCustomer(cusDAO.getById(b.getCustomerId()));
                StaffDAO staffDAO = new StaffDAO();
                b.setStaff(staffDAO.getById(b.getStaffId()));
                StatusDAO statusDAO = new StatusDAO();
                b.setStatus(statusDAO.getById(b.getStatusId()));
                BillDetailDAO bdDAO = new BillDetailDAO();
                b.setLstBillDetail(bdDAO.getByBillId(b.getBillId()));
                return b;
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    //find by cusid
    public ArrayList<Bill> getByCustomerId(int cusID) {
        ArrayList<Bill> lst = new ArrayList<>();
        String sql = "select * from Bill where CustomerID=" + cusID;
        try {
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Bill b = new Bill();
                b.setBillId(rs.getInt("BillID"));
                b.setBillDate(rs.getDate("BillDate"));
                b.setCustomerId(rs.getInt("CustomerID"));
                b.setStaffId(rs.getInt("StaffID"));
                b.setStatusId(rs.getInt("StatusID"));
                CustomerDAO cusDAO = new CustomerDAO();
                b.setCustomer(cusDAO.getById(b.getCustomerId()));
                StaffDAO staffDAO = new StaffDAO();
                b.setStaff(staffDAO.getById(b.getStaffId()));
                StatusDAO statusDAO = new StatusDAO();
                b.setStatus(statusDAO.getById(b.getStatusId()));
                BillDetailDAO bdDAO = new BillDetailDAO();
                b.setLstBillDetail(bdDAO.getByBillId(b.getBillId()));
                lst.add(b);
            }
            return lst;
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    //get id
    public Bill getById(int id) {
        String sql = "select * from Bill where BillID=" + id;
        try {
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                Bill b = new Bill();
                b.setBillId(rs.getInt("BillID"));
                b.setBillDate(rs.getDate("BillDate"));
                b.setCustomerId(rs.getInt("CustomerID"));
                b.setStaffId(rs.getInt("StaffID"));
                b.setStatusId(rs.getInt("StatusID"));
                CustomerDAO cusDAO = new CustomerDAO();
                b.setCustomer(cusDAO.getById(b.getCustomerId()));
                StaffDAO staffDAO = new StaffDAO();
                b.setStaff(staffDAO.getById(b.getStaffId()));
                StatusDAO statusDAO = new StatusDAO();
                b.setStatus(statusDAO.getById(b.getStatusId()));
                BillDetailDAO bdDAO = new BillDetailDAO();
                b.setLstBillDetail(bdDAO.getByBillId(b.getBillId()));
                return b;
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    //get bill process
    public ArrayList<Bill> getBillProcess(int staffid) {
        ArrayList<Bill> lst = new ArrayList<>();
        try {
            String sql = "select * from Bill where StaffID=" + staffid + " or StaffID is null";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Bill b = new Bill();
                b.setBillId(rs.getInt("BillID"));
                b.setBillDate(rs.getDate("BillDate"));
                b.setCustomerId(rs.getInt("CustomerID"));
                b.setStaffId(rs.getInt("StaffID"));
                b.setStatusId(rs.getInt("StatusID"));
                CustomerDAO cusDAO = new CustomerDAO();
                b.setCustomer(cusDAO.getById(b.getCustomerId()));
                StaffDAO staffDAO = new StaffDAO();
                b.setStaff(staffDAO.getById(b.getStaffId()));
                StatusDAO statusDAO = new StatusDAO();
                b.setStatus(statusDAO.getById(b.getStatusId()));
                BillDetailDAO bdDAO = new BillDetailDAO();
                b.setLstBillDetail(bdDAO.getByBillId(b.getBillId()));
                lst.add(b);
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }

    //get all
    public ArrayList<Bill> getAll() {
        ArrayList<Bill> lst = new ArrayList<>();
        try {
            String sql = "select * from Bill";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Bill b = new Bill();
                b.setBillId(rs.getInt("BillID"));
                b.setBillDate(rs.getDate("BillDate"));
                b.setCustomerId(rs.getInt("CustomerID"));
                b.setStaffId(rs.getInt("StaffID"));
                b.setStatusId(rs.getInt("StatusID"));
                CustomerDAO cusDAO = new CustomerDAO();
                b.setCustomer(cusDAO.getById(b.getCustomerId()));
                StaffDAO staffDAO = new StaffDAO();
                b.setStaff(staffDAO.getById(b.getStaffId()));
                StatusDAO statusDAO = new StatusDAO();
                b.setStatus(statusDAO.getById(b.getStatusId()));
                BillDetailDAO bdDAO = new BillDetailDAO();
                b.setLstBillDetail(bdDAO.getByBillId(b.getBillId()));
                lst.add(b);
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }
}
