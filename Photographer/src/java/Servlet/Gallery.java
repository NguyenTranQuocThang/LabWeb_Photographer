/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DB.Sql;
import Model.DetailGallery;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thang
 */
public class Gallery extends HttpServlet {

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
        try {
            Sql sql = new Sql();
            ArrayList<Model.Gallery> top3Gallery = sql.getTop3Gallery();
            request.setAttribute("top3Gallery", top3Gallery);
            String idGet = request.getParameter("id");
            // check if have error send text to page
            String textSend = null;
            try {
                int id = Integer.parseInt(idGet);
                request.setAttribute("checkBold", id);
                // check gallery in database if == 1 => exist else don't exist
                int countGalleryById = sql.countGalleryById(id);
                if(countGalleryById != 1){
                    textSend ="Library not found";
                }
                Model.Gallery gallery = sql.getGalleryById(id);
                request.setAttribute("gallery", gallery);
                
                String pagenumber = request.getParameter("page");
                // page now
                int pageindex = 1;
                // sum element of 1 page
                int pagesize =  8;
                // count all Detail Gallery by id
                int count = sql.countDetailGallery(id);
                // sum page 
                int pagecount = (count % pagesize == 0) ? count/pagesize : (count/pagesize)+ 1;
                
                try {
                    // check page null
                    if(pagenumber == null){
                        pagenumber = "1";
                    }
                    
                    pageindex = Integer.parseInt(pagenumber);
                    // > 0 => check library not found
                    if(pageindex > pagecount && pagecount > 0){
                        textSend ="page not found";
                    }
                    ArrayList<DetailGallery> detailGalleryList = sql.getDeailGalleryPaging(id, pageindex, pagesize);
                    request.setAttribute("detailGalleryList", detailGalleryList);
                } catch (Exception e) {
                    System.out.println(e);
                    textSend ="page not found";
                }
                request.setAttribute("pageindex", pageindex);
                request.setAttribute("pagecount", pagecount);
            } catch (Exception e) {
                textSend ="Library not found";
            }
            request.setAttribute("textSend", textSend);
            request.getRequestDispatcher("Gallery.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("Error.jsp").forward(request, response);
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
