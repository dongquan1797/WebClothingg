/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;


public class UtilDB {
    private Connection conn;
    
    public UtilDB(){}

    public UtilDB(Connection conn) {
        this.conn = conn;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
    
    public void connect(){
        if(conn==null){
            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=SHOESSHOP1;user=sa;password=quan123456@";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection(dbURL);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }
        }
    }

    public void disconnect(){
        if(conn!=null){
            try {
                conn.close();
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Error disconnect: "+e);
            }
        }
    }
    
    //check connection
    public static void main(String[] args) {
        try {
            UtilDB db = new UtilDB();
            db.connect();
            System.out.println(db.getConn());
        } catch (Exception e) {
        }
    }
    
}
