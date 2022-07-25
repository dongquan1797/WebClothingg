/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quan.controller;

import com.tin.dao.ManufacturerDAO;
import com.tin.dao.NationDAO;
import com.tin.model.Manufacturer;
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
@WebServlet(name = "AdminManufacturer", urlPatterns = {"/AdminManufacturer"})
public class AdminManufacturer extends HttpServlet {
    public int nationID = 0;
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
        ManufacturerDAO maDAO = new ManufacturerDAO();
        NationDAO naDAO = new NationDAO();
        switch(action){
            case 0:
                if(request.getParameter("id") != null){
                    nationID = Integer.parseInt(request.getParameter("id"));                    
                }
                ArrayList<Manufacturer> lstManufacturer = new ArrayList<>();
                if(nationID==0){
                    lstManufacturer = maDAO.getNewManufacturer(10);                    
                } else{
                    lstManufacturer = maDAO.getByNation(nationID);
                }
                ArrayList<Nation> lstNation = naDAO.getAll();
                request.setAttribute("lstNation", lstNation);
                request.setAttribute("lstManufacturer", lstManufacturer);
                RequestDispatcher d = request.getRequestDispatcher("/admin/manufacturer.jsp");
                d.forward(request, response);
                break;
            case 1:
                lstNation = naDAO.getAll();
                request.setAttribute("lstNation", lstNation);
                d = request.getRequestDispatcher("/admin/addmanufacturer.jsp");
                d.forward(request, response);
                break;
            case 2:
                Manufacturer m = new Manufacturer();
                m.setManufacturerName(request.getParameter("maName"));
                m.setNationId(Integer.parseInt(request.getParameter("naName")));
                if(maDAO.Addnew(m)){
                    response.sendRedirect(request.getContextPath() + "/AdminManufacturer?action=0&id=" + nationID);
                }
                break;
            case 3:
                int id = Integer.parseInt(request.getParameter("id"));
                Manufacturer ma = maDAO.getById(id);
                lstNation = naDAO.getAll();
                request.setAttribute("lstNation", lstNation);
                request.setAttribute("manufacturer", ma);
                d = request.getRequestDispatcher("/admin/editmanufacturer.jsp");
                d.forward(request, response);
                break;
            case 4:
            ma = maDAO.getById(Integer.parseInt(request.getParameter("maId")));
            ma.setManufacturerName(request.getParameter("maName"));
            ma.setNationId(Integer.parseInt(request.getParameter("naID")));
            if(maDAO.update(ma)){
                response.sendRedirect(request.getContextPath() + "/AdminManufacturer?action=0&id=" + nationID);
            }
            break;
            case 5:
                id=Integer.parseInt(request.getParameter("id"));
                if(maDAO.delete(id)){
                    response.sendRedirect(request.getContextPath() + "/AdminManufacturer?action=0&id=" + nationID);
                } else{
                    response.sendRedirect(request.getContextPath() + "/admin/404.jsp");
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
