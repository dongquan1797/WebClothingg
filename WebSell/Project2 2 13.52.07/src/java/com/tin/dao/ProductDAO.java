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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


/**
 *
 * @author Tin
 */
public class ProductDAO {
    private UtilDB utilDB;

    public ProductDAO() {
        utilDB =  new UtilDB();
        utilDB.connect();    
    }
    
    public UtilDB getUtilDB() {
        return utilDB;
    }

    public void setUtilDB(UtilDB utilDB) {
        this.utilDB = utilDB;
    }
    
    //get all
    public ArrayList<Product> getAll(){
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql="select * from Product";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setDateOfManufacturer(rs.getDate("DateOfManufacturer"));
                p.setCategoryId(rs.getInt("CategoryID"));
                p.setManufacturerId(rs.getInt("ManufacturerID"));
                p.setPrice(rs.getInt("Price"));
                p.setImages(rs.getString("Images"));
                CategoryDAO cate = new CategoryDAO();
                p.setCategory(cate.getById(p.getCategoryId()));
                ManufacturerDAO manu = new ManufacturerDAO();
                p.setManufacturer(manu.getById(p.getManufacturerId()));
                list.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    //get by cate
    public ArrayList<Product> getByCategory(int categoryID){
        ArrayList<Product> lst = new ArrayList<>();
        try {
            String sql="select * from Product where CategoryID="+categoryID + " order by DateOfManufacturer desc";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setDateOfManufacturer(rs.getDate("DateOfManufacturer"));
                p.setCategoryId(rs.getInt("CategoryID"));
                p.setManufacturerId(rs.getInt("ManufacturerID"));
                p.setPrice(rs.getInt("Price"));
                p.setImages(rs.getString("Images"));
                CategoryDAO cateDAO = new CategoryDAO();
                p.setCategory(cateDAO.getById(p.getCategoryId()));
                ManufacturerDAO maDAO = new ManufacturerDAO();
                p.setManufacturer(maDAO.getById(p.getManufacturerId()));
                lst.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }
    
    //get new product
    public ArrayList<Product> getNewProduct(int number){
        ArrayList<Product> lst = new ArrayList<>();
        try {
            String sql="select top "+ number +" * from Product order by DateOfManufacturer desc";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setDateOfManufacturer(rs.getDate("DateOfManufacturer"));
                p.setCategoryId(rs.getInt("CategoryID"));
                p.setManufacturerId(rs.getInt("ManufacturerID"));
                p.setPrice(rs.getInt("Price"));
                p.setImages(rs.getString("Images"));
                CategoryDAO cateDAO = new CategoryDAO();
                p.setCategory(cateDAO.getById(p.getCategoryId()));
                ManufacturerDAO maDAO = new ManufacturerDAO();
                p.setManufacturer(maDAO.getById(p.getManufacturerId()));
                lst.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }
    
    //get new product for pagination
    public ArrayList<Product> getNewProductForPagination(int numPage){
        ArrayList<Product> lst = new ArrayList<>();
        try {
            String sql="select * from Product order by ProductID offset "+(numPage-1)*8+" rows fetch next 8 rows only";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setDateOfManufacturer(rs.getDate("DateOfManufacturer"));
                p.setCategoryId(rs.getInt("CategoryID"));
                p.setManufacturerId(rs.getInt("ManufacturerID"));
                p.setPrice(rs.getInt("Price"));
                p.setImages(rs.getString("Images"));
                CategoryDAO cateDAO = new CategoryDAO();
                p.setCategory(cateDAO.getById(p.getCategoryId()));
                ManufacturerDAO maDAO = new ManufacturerDAO();
                p.setManufacturer(maDAO.getById(p.getManufacturerId()));
                lst.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }
    
    
    //get by id
    public Product getById(int id){        
        try {
            String sql="select * from Product where ProductID="+id;
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setDateOfManufacturer(rs.getDate("DateOfManufacturer"));
                p.setCategoryId(rs.getInt("CategoryID"));
                p.setManufacturerId(rs.getInt("ManufacturerID"));
                p.setPrice(rs.getInt("Price"));
                p.setImages(rs.getString("Images"));
                CategoryDAO cateDAO = new CategoryDAO();
                p.setCategory(cateDAO.getById(p.getCategoryId()));
                ManufacturerDAO maDAO = new ManufacturerDAO();
                p.setManufacturer(maDAO.getById(p.getManufacturerId()));
                return p;
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    
    //get count
    public int getCount(int categoryId){
        int count=0;
        try {
            String sql="select * from Product where CategoryID="+categoryId;
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                count++;                
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }
        
    
    //get cate have to constructor
    public ArrayList<Product> getByCategory(int categoryID, int start, int number){
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product where CategoryID=? order by ProductID offset ? rows fetch next ? rows only";
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setInt(1, categoryID);
            pstm.setInt(2, start);
            pstm.setInt(3, number);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setDateOfManufacturer(rs.getDate("DateOfManufacturer"));
                p.setCategoryId(rs.getInt("CategoryID"));
                p.setManufacturerId(rs.getInt("ManufacturerID"));
                p.setPrice(rs.getInt("Price"));
                p.setImages(rs.getString("Images"));
                CategoryDAO cateDAO = new CategoryDAO();
                p.setCategory(cateDAO.getById(p.getCategoryId()));
                ManufacturerDAO maDAO = new ManufacturerDAO();
                p.setManufacturer(maDAO.getById(p.getManufacturerId()));
                list.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    //get category sort
    public ArrayList<Product> getByCategories(int cateID, int start, int number, int typeSort){
        ArrayList<Product> lst = new ArrayList<>();
        try {
            String sql="select * from Product where CategoryID = 1 order by";
            switch(typeSort){
                case 0:
                    sql+=" DateOfManufacturer desc";
                    break;
                case 1:
                    sql+=" Price";
                    break;
                case 2:
                    sql+=" Price desc";
                    break;
                default:
                    sql+=" ProductID";
                    break;
            }
            sql+=" offset ? rows fetch next ? rows only";
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setInt(1, cateID);
            pstm.setInt(2, start);
            pstm.setInt(3, number);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setDateOfManufacturer(rs.getDate("DateOfManufacturer"));
                p.setCategoryId(rs.getInt("CategoryID"));
                p.setManufacturerId(rs.getInt("ManufacturerID"));
                p.setPrice(rs.getInt("Price"));
                p.setImages(rs.getString("Images"));
                CategoryDAO cateDAO = new CategoryDAO();
                p.setCategory(cateDAO.getById(p.getCategoryId()));
                ManufacturerDAO maDAO = new ManufacturerDAO();
                p.setManufacturer(maDAO.getById(p.getManufacturerId()));
                lst.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }
            
            
    //search by key
    public ArrayList<Product> searchByKey(String key){
        ArrayList<Product> lst = new ArrayList<>();
        try {
            String sql="select * from Product where ProductName like '%"+key+"%'";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setDateOfManufacturer(rs.getDate("DateOfManufacturer"));
                p.setCategoryId(rs.getInt("CategoryID"));
                p.setManufacturerId(rs.getInt("ManufacturerID"));
                p.setPrice(rs.getInt("Price"));
                p.setImages(rs.getString("Images"));
                CategoryDAO cateDAO = new CategoryDAO();
                p.setCategory(cateDAO.getById(p.getCategoryId()));
                ManufacturerDAO maDAO = new ManufacturerDAO();
                p.setManufacturer(maDAO.getById(p.getManufacturerId()));
                lst.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }
    //get cate for admin
    public ArrayList<Product> getByCategoryAdmin(int cateID){
        ArrayList<Product> lst = new ArrayList<>();
        try {
            String sql="select top 30 * from Product where CategoryID= " +cateID +" order by DateOfManufacturer desc";
            Statement stm = utilDB.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setDateOfManufacturer(rs.getDate("DateOfManufacturer"));
                p.setCategoryId(rs.getInt("CategoryID"));
                p.setManufacturerId(rs.getInt("ManufacturerID"));
                p.setPrice(rs.getInt("Price"));
                p.setImages(rs.getString("Images"));
                CategoryDAO cateDAO = new CategoryDAO();
                p.setCategory(cateDAO.getById(p.getCategoryId()));
                ManufacturerDAO maDAO = new ManufacturerDAO();
                p.setManufacturer(maDAO.getById(p.getManufacturerId()));
                lst.add(p);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lst;
    }
    
    //add new
    public boolean AddNew(Product p){
        String sql="insert into Product(ProductName, Description, DateOfManufacturer, CategoryID, ManufacturerID, Price, Images) values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, p.getProductName());
            pstm.setString(2, p.getDescription());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(3, sdf.format(p.getDateOfManufacturer()));
            pstm.setInt(4, p.getCategoryId());
            pstm.setInt(5, p.getManufacturerId());
            pstm.setInt(6, p.getPrice());
            pstm.setString(7, p.getImages());
            int rs = pstm.executeUpdate();
            if(rs!=0) return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }
    
    //update
    public boolean update(Product p){
        String sql="update Product set ProductName=?, Description=?, DateOfManufacturer=?, CategoryID=?, ManufacturerID=?, Price=?, Images=? where ProductID=?";
        try {
            PreparedStatement pstm = utilDB.getConn().prepareStatement(sql);
            pstm.setString(1, p.getProductName());
            pstm.setString(2, p.getDescription());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(3, sdf.format(p.getDateOfManufacturer()));
            pstm.setInt(4, p.getCategoryId());
            pstm.setInt(5, p.getManufacturerId());
            pstm.setInt(6, p.getPrice());
            pstm.setString(7, p.getImages());
            pstm.setInt(8, p.getProductId());
            int rs = pstm.executeUpdate();
            if(rs!=0) return true;
        } catch (Exception e) {
            return false;
        }
        return false;
    }
    
    //delete
    public boolean delete(int id){
        boolean flag=false;
        String sql="select * from BillDetail where ProductID="+id;
        try {
            Statement stm1 = utilDB.getConn().createStatement();
            ResultSet rs1 = stm1.executeQuery(sql);
            while(rs1.next()) flag=true;
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        if(flag==true){
            return false;
        } else{
            String query="delete Product where ProductID=?";
            try {
                PreparedStatement pstm = utilDB.getConn().prepareStatement(query);
                pstm.setInt(1, id);
                int rs = pstm.executeUpdate();
                if(rs!=0) return true;
            } catch (Exception e) {
                return false;
            }
        }
        return false;
    }
}
