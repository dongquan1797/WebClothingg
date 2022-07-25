/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.dao;

import com.tin.model.BillDetail;
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
public class BillDetailDAO {
    private UtilDB utilDB;

    public UtilDB getUtilDB() {
        return utilDB;
    }

    public void setUtilDB(UtilDB utilDB) {
        this.utilDB = utilDB;
    }

    public BillDetailDAO() {
        utilDB = new UtilDB();
        utilDB.connect();
    }
    
    //add new
    public boolean addNew(BillDetail bd){
        String sql="insert into BillDetail(BillID, ProductID, Quantity) values(?,?,?)";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setInt(1, bd.getBillId());
            pstm.setInt(2, bd.getProductId());
            pstm.setInt(3, bd.getQuantity());
            int rs = pstm.executeUpdate();
            if(rs!=0)
                return true;
        } catch (Exception e) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
    //getbyid
    public ArrayList<BillDetail> getByBillId(int id){
        ArrayList<BillDetail> lst = new ArrayList<>();
        String sql="select * from BillDetail where BillID="+id;
        try {
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                BillDetail bd = new BillDetail();
                bd.setBillId(rs.getInt("BillID"));
                bd.setProductId(rs.getInt("ProductID"));
                bd.setQuantity(rs.getInt("Quantity"));
                ProductDAO proDAO = new ProductDAO();
                bd.setProduct(proDAO.getById(bd.getProductId()));
                lst.add(bd); 
            }
            return lst;
        } catch (Exception e) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }    
}
