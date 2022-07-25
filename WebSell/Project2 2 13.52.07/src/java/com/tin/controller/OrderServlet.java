/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quan.controller;

import com.tin.dao.*;
import com.tin.model.Bill;
import com.tin.model.BillDetail;
import com.tin.model.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tin
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String userName = (String)request.getSession().getAttribute("user");
        if(request.getSession().getAttribute("user")==null){
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else{
            ProductDAO proDAO = new ProductDAO();
            BillDAO billDAO = new BillDAO();
            CustomerDAO cusDAO = new CustomerDAO();
            BillDetailDAO bdDAO = new BillDetailDAO();
            Bill newbill = new Bill();
            newbill.setBillDate(new Date()); //get today
            newbill.setCustomerId(cusDAO.getByUserName(userName).getCustomerId());
            newbill.setStatusId(1);
            if(billDAO.addNew(newbill)){
                Bill item = billDAO.getNewBill(); //get order add
                ArrayList<CartItem> lst = (ArrayList<CartItem>)request.getSession().getAttribute("listItem");
                for(CartItem element:lst){
                    BillDetail newBillDetail = new BillDetail();
                    newBillDetail.setBillId(item.getBillId());
                    newBillDetail.setProductId(element.getProduct().getProductId());
                    newBillDetail.setQuantity(element.getQuantity());
                    boolean rs = bdDAO.addNew(newBillDetail);
                    if(rs==false){
                        RequestDispatcher dispatcher = request.getRequestDispatcher("billdetail.jsp");
                        dispatcher.forward(request, response);
                    }
                }
                request.getSession().removeAttribute("listItem");
                RequestDispatcher d = request.getRequestDispatcher("index.jsp");
                d.forward(request, response);
            } else{
                RequestDispatcher d = request.getRequestDispatcher("billdetail.jsp");
                d.forward(request, response);
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
