/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quan.controller;

import com.tin.dao.CustomerDAO;
import com.tin.model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quan
 */
@WebServlet(name = "AdminCustomer", urlPatterns = {"/AdminCustomer"})
public class AdminCustomer extends HttpServlet {

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
        int action = Integer.parseInt(request.getParameter("action"));
        CustomerDAO cusDAO = new CustomerDAO();
        switch (action) {
            case 0:
                ArrayList<Customer> lst = cusDAO.getAll();
                request.setAttribute("listCustomer", lst);
                RequestDispatcher d = request.getRequestDispatcher("/admin/customer.jsp");
                d.forward(request, response);
                break;
            case 1:
                Customer newItem = new Customer();
                newItem.setCustomerName(request.getParameter("cusName"));                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    newItem.setDateOfBirth(sdf.parse(request.getParameter("date")));
                } catch (Exception e) {
                    Logger.getLogger(AdminCustomer.class.getName()).log(Level.SEVERE, null, e);
                }                
                newItem.setPhone(request.getParameter("phone"));
                newItem.setAddress(request.getParameter("address"));
                newItem.setEmail(request.getParameter("email"));
                newItem.setUsername(request.getParameter("user"));
                newItem.setPassword(request.getParameter("pass"));
                if (cusDAO.addNew(newItem)) {
                    d = request.getRequestDispatcher("/AdminCustomer?action=0");
                    d.forward(request, response);
                }
                break;
            case 2:
                int id = Integer.parseInt(request.getParameter("id"));
                Customer c = cusDAO.getById(id);
                request.setAttribute("customer", c);
                d = request.getRequestDispatcher("/admin/editcustomer.jsp");
                d.forward(request, response);
                break;
            case 3:
                id = Integer.parseInt(request.getParameter("id"));
                if(cusDAO.delete(id)){
                    d = request.getRequestDispatcher("/AdminCustomer?action=0");
                    d.forward(request, response);
                } else{
                    response.sendRedirect(request.getContextPath()+"/admin/500.jsp");
                }
                break;                
            case 4:
                Customer cu = new Customer();
                cu.setCustomerId(Integer.parseInt(request.getParameter("cusId")));
                cu.setCustomerName(request.getParameter("cusName"));
                sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    cu.setDateOfBirth(sdf.parse(request.getParameter("date")));
                } catch (Exception e) {
                    Logger.getLogger(AdminCustomer.class.getName()).log(Level.SEVERE, null, e);
                }
                cu.setPhone(request.getParameter("phone"));
                cu.setAddress(request.getParameter("address"));
                cu.setEmail(request.getParameter("email"));
                cu.setUsername(request.getParameter("user"));
                cu.setPassword(request.getParameter("pass"));
                if(cusDAO.update(cu)){
                    d = request.getRequestDispatcher("/AdminCustomer?action=0");
                    d.forward(request, response);
                }
                break;
                    
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
