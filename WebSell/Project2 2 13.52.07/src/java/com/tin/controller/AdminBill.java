/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quan.controller;

import com.tin.dao.BillDAO;
import com.tin.dao.StatusDAO;
import com.tin.model.Bill;
import com.tin.model.Staff;
import com.tin.model.Status;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "AdminBill", urlPatterns = {"/AdminBill"})
public class AdminBill extends HttpServlet {

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
        BillDAO billDAO = new BillDAO();
        StatusDAO statusDAO = new StatusDAO();
        Staff admin = (Staff) request.getSession().getAttribute("adminUser");
        switch (action) {
            case 0:
                ArrayList<Bill> lstBill = new ArrayList<>();
                if (admin.isAdmin()) {
                    lstBill = billDAO.getAll();
                } else {
                    lstBill = billDAO.getBillProcess(admin.getStaffId());
                }
                request.setAttribute("lstBill", lstBill);
                RequestDispatcher d = request.getRequestDispatcher("/admin/bill.jsp");
                d.forward(request, response);
                break;
            case 1:
                int id = Integer.parseInt(request.getParameter("id"));
                Bill bill = billDAO.getById(id);
                bill.setStaff(admin);
                ArrayList<Status> lstStatus = statusDAO.getAll();
                request.setAttribute("bill", bill);
                request.setAttribute("lstStatus", lstStatus);
                d = request.getRequestDispatcher("/admin/editbill.jsp");
                d.forward(request, response);
                break;
            case 2:
                id = Integer.parseInt(request.getParameter("id"));
                bill = billDAO.getById(id);
                bill.setStaff(admin);
                request.setAttribute("bill", bill);
                d = request.getRequestDispatcher("/admin/detailsbill.jsp");
                d.forward(request, response);
                break;
            case 3:
                id = Integer.parseInt(request.getParameter("id"));
                int statusid = Integer.parseInt(request.getParameter("statusid"));
                bill = billDAO.getById(id);
                bill.setStaff(admin);
                bill.setStaffId(admin.getStaffId());
                bill.setStatusId(statusid);
                if (billDAO.update(bill)) {
                    d = request.getRequestDispatcher("/AdminBill?action=0");
                    d.forward(request, response);
                } else {
                    d = request.getRequestDispatcher("/admin/404.jsp");
                    d.forward(request, response);
                }
                break;
            case 4:
                id = Integer.parseInt(request.getParameter("id"));
                bill = billDAO.getById(id);
                if (billDAO.delete(bill)) {
                    d = request.getRequestDispatcher("/AdminBill?action=0");
                    d.forward(request, response);
                } else {
                    d = request.getRequestDispatcher("/admin/404.jsp");
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
