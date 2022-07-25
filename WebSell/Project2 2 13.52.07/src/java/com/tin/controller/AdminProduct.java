/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.quan.controller;

import com.tin.dao.CategoryDAO;
import com.tin.dao.ManufacturerDAO;
import com.tin.dao.ProductDAO;
import com.tin.model.Category;
import com.tin.model.Manufacturer;
import com.tin.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Quan
 */
@WebServlet(name = "AdminProduct", urlPatterns = {"/AdminProduct"})
@MultipartConfig
public class AdminProduct extends HttpServlet {
    public int cateID = 0;
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
        ProductDAO proDAO = new ProductDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        int action = Integer.parseInt(request.getParameter("action"));
        switch (action) {
            case 0:
                if (request.getParameter("id") != null) {
                    cateID = Integer.parseInt(request.getParameter("id"));
                }
                ArrayList<Product> lstProduct = new ArrayList<>();
                //get 30 new product
                if (cateID == 0) {
                    lstProduct = proDAO.getNewProduct(30);
                } else {
                    lstProduct = proDAO.getByCategoryAdmin(cateID);
                }
                ArrayList<Category> lstCategory = cateDAO.getAll();
                request.setAttribute("lstCategory", lstCategory);
                request.setAttribute("lstProduct", lstProduct);
                RequestDispatcher d = request.getRequestDispatcher("/admin/product.jsp");
                d.forward(request, response);
                break;
//                Redicrect to ADD NEW
            case 1:
                ManufacturerDAO maDAO = new ManufacturerDAO();
                lstCategory = cateDAO.getAll();
                ArrayList<Manufacturer> lstManufacturer = maDAO.getAll();
                request.setAttribute("lstCategory", lstCategory);
                request.setAttribute("lstManufacturer", lstManufacturer);
                d = request.getRequestDispatcher("/admin/addproduct.jsp");
                d.forward(request, response);
                break;
//                get parameter and fill in box
            case 2:
                Product p = new Product();
                p.setProductName(request.getParameter("ProductName"));
                p.setDescription(request.getParameter("Description"));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    p.setDateOfManufacturer(sdf.parse(request.getParameter("DateOfManufacturer")));
                } catch (Exception e) {
                    Logger.getLogger(AdminProduct.class.getName()).log(Level.SEVERE, null, e);
                }
                p.setCategoryId(Integer.parseInt(request.getParameter("cateID")));
                p.setManufacturerId(Integer.parseInt(request.getParameter("manuID")));
                p.setPrice(Integer.parseInt(request.getParameter("Price")));
                Part part = request.getPart("Images");
                String dirURL = request.getServletContext().getRealPath("") + "Images\\" + part.getSubmittedFileName();
                part.write(dirURL);
                p.setImages(part.getSubmittedFileName());
                if (proDAO.AddNew(p)) {
                    response.sendRedirect(request.getContextPath() + "/AdminProduct?action=0&id=" + cateID);
                }
                break;
//                get id when click update
            case 3:
                maDAO = new ManufacturerDAO();
                int proid = Integer.parseInt(request.getParameter("proid"));
                Product pro = proDAO.getById(proid);
                lstCategory = cateDAO.getAll();
                lstManufacturer = maDAO.getAll();
                request.setAttribute("listCategory", lstCategory);
                request.setAttribute("listManufacturer", lstManufacturer);
                request.setAttribute("product", pro);
                d = request.getRequestDispatcher("/admin/editproduct.jsp");
                d.forward(request, response);
                break;
            case 4:
                p = proDAO.getById(Integer.parseInt(request.getParameter("ProductID")));
                p.setProductName(request.getParameter("ProductName"));
                p.setDescription(request.getParameter("Description"));
                sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    p.setDateOfManufacturer(sdf.parse(request.getParameter("DateOfManufacturer")));
                } catch (Exception e) {
                    Logger.getLogger(AdminProduct.class.getName()).log(Level.SEVERE, null, e);
                }
                p.setCategoryId(Integer.parseInt(request.getParameter("cateID")));
                p.setManufacturerId(Integer.parseInt(request.getParameter("manuID")));
                String newP = request.getParameter("Price").replace(",", "");                
                p.setPrice(Integer.parseInt(newP));                
                part = request.getPart("Images");
                if (!part.getSubmittedFileName().equals("")) {
                    dirURL = request.getServletContext().getRealPath("") + "Images\\" + part.getSubmittedFileName();
                    part.write(dirURL);
                    p.setImages(part.getSubmittedFileName());
                }
                if (proDAO.update(p)) {
                    response.sendRedirect(request.getContextPath() + "/AdminProduct?action=0&id=" + cateID);
                }
                break;
            case 5:
                proid=Integer.parseInt(request.getParameter("proid"));
                if(proDAO.delete(proid)){
                    response.sendRedirect(request.getContextPath()+"/AdminProduct?action=0&id="+cateID);
                } else{
                    response.sendRedirect(request.getContextPath()+"/admin/401.jsp");
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
