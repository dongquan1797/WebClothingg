/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quan.controller;

import com.tin.dao.StaffDAO;
import com.tin.model.Staff;
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
 * @author Tin
 */
@WebServlet(name = "AdminStaff", urlPatterns = {"/admin/AdminStaff"})
public class AdminStaff extends HttpServlet {

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
        StaffDAO staDAO = new StaffDAO();
        switch(action){
            case 0:
                ArrayList<Staff> lst = staDAO.getAll();
                request.setAttribute("lstStaff", lst);
                RequestDispatcher d = request.getRequestDispatcher("/admin/staff.jsp");
                d.forward(request, response);
                break;
            case 1:
                Staff s = new Staff();
                s.setFullName(request.getParameter("staffName"));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    s.setDateOfBirth(sdf.parse(request.getParameter("dates")));
                } catch (Exception e) {
                    Logger.getLogger(AdminStaff.class.getName()).log(Level.SEVERE, null, e);
                } 
                s.setGender(Boolean.parseBoolean(request.getParameter("gender")));
                s.setAddress(request.getParameter("address"));
                s.setPhone(request.getParameter("phone"));
                s.setUserName(request.getParameter("user"));
                s.setPassWord(request.getParameter("pass"));
                s.setAdmin(true);
                if(staDAO.addNew(s)){
                    d= request.getRequestDispatcher("/admin/AdminStaff?action=0");
                    d.forward(request, response);
                }
                break;
            case 2:
                int id = Integer.parseInt(request.getParameter("id"));
                Staff st = staDAO.getById(id);
                request.setAttribute("staff", st);
                d = request.getRequestDispatcher("/admin/editstaff.jsp");
                d.forward(request, response);
                break;
            case 3:
                id = Integer.parseInt(request.getParameter("id"));
                if(staDAO.delete(id)){
                    d= request.getRequestDispatcher("/admin/AdminStaff?action=0");
                    d.forward(request, response);
                } else{
                    response.sendRedirect(request.getContextPath()+"/admin/500.jsp");
                }
                break;
            case 4:
                Staff sta = new Staff();
                sta.setStaffId(Integer.parseInt(request.getParameter("staffID")));
                sta.setFullName(request.getParameter("staffName"));
                sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    sta.setDateOfBirth(sdf.parse(request.getParameter("dates")));
                } catch (Exception e) {
                    Logger.getLogger(AdminStaff.class.getName()).log(Level.SEVERE, null, e);
                }
                sta.setGender(Boolean.parseBoolean(request.getParameter("gender")));
                sta.setAddress(request.getParameter("address"));
                sta.setPhone(request.getParameter("phone"));
                sta.setUserName(request.getParameter("user"));
                sta.setPassWord(request.getParameter("pass"));
                sta.setAdmin(true);
                if(staDAO.update(sta)){
                    d= request.getRequestDispatcher("/admin/AdminStaff?action=0");
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
