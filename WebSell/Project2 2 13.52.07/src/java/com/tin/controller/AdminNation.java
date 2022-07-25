/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quan.controller;

import com.tin.dao.NationDAO;
import com.tin.model.Nation;
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
@WebServlet(name = "AdminNation", urlPatterns = {"/AdminNation"})
public class AdminNation extends HttpServlet {

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
        NationDAO naDAO = new NationDAO();
        switch (action) {
            case 0:
                ArrayList<Nation> lst = naDAO.getAll();
                request.setAttribute("listNation", lst);
                RequestDispatcher d = request.getRequestDispatcher("/admin/nation.jsp");
                d.forward(request, response);
                break;
            case 1:
                Nation newItem = new Nation();
                newItem.setNationName(request.getParameter("nationname"));
                if (naDAO.addNew(newItem)) {
                    d = request.getRequestDispatcher("/AdminNation?action=0");
                    d.forward(request, response);
                }
                break;
            case 2:
                int id = Integer.parseInt(request.getParameter("id"));
                Nation n = naDAO.getById(id);
                request.setAttribute("nation", n);
                d = request.getRequestDispatcher("/admin/editnation.jsp");
                d.forward(request, response);
                break;
            case 3:
                id = Integer.parseInt(request.getParameter("id"));
                if(naDAO.delete(id)){
                    d=request.getRequestDispatcher("/AdminNation?action=0");
                    d.forward(request, response);
                } else{
                    response.sendRedirect(request.getContextPath()+"/admin/500.jsp");
                }
                break;                
            case 4:
                Nation N = new Nation();
                N.setNationId(Integer.parseInt(request.getParameter("nationid")));
                N.setNationName(request.getParameter("nationname"));
                if(naDAO.update(N)){
                    d = request.getRequestDispatcher("/AdminNation?action=0");
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
