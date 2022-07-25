/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quan.controller;

import com.tin.dao.StatusDAO;
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
 * @author Tin
 */
@WebServlet(name = "AdminStatus", urlPatterns = {"/AdminStatus"})
public class AdminStatus extends HttpServlet {

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
        StatusDAO sDAO = new StatusDAO();
        switch(action){
            case 0:
                ArrayList<Status> lst = sDAO.getAll();
                request.setAttribute("lstStatus", lst);
                RequestDispatcher d = request.getRequestDispatcher("/admin/status.jsp");
                d.forward(request, response);
                break;
            case 1:
                Status s = new Status();
                s.setStatusName(request.getParameter("staName"));
                if(sDAO.addNew(s)){
                    d = request.getRequestDispatcher("/AdminStatus?action=0");
                    d.forward(request, response);
                    break;
                }
            case 2:
                int id = Integer.parseInt(request.getParameter("id"));
                Status st = sDAO.getById(id);
                request.setAttribute("status", st);
                d = request.getRequestDispatcher("/admin/editstatus.jsp");
                d.forward(request, response);
                break;
            case 3:
                id = Integer.parseInt(request.getParameter("id"));
                if(sDAO.delete(id)){
                    d = request.getRequestDispatcher("/AdminStatus?action=0");
                    d.forward(request, response);
                } else{
                    response.sendRedirect(request.getContextPath()+"/admin/500.jsp");
                }
                break;                
            case 4:
                Status sta = new Status();
                sta.setStatusId(Integer.parseInt(request.getParameter("staID")));
                sta.setStatusName(request.getParameter("staName"));
                if(sDAO.update(sta)){
                    d=request.getRequestDispatcher("/AdminStatus?action=0");
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
