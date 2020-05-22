/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DB.Sql;
import Model.Contact;
import Model.Gallery;
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
public class Home extends HttpServlet {

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
            Contact contact = sql.getContact();
            
            request.setAttribute("contact", contact);
            ArrayList<Gallery> top3Gallery = sql.getTop3Gallery();
            request.setAttribute("top3Gallery", top3Gallery);
            
            // check if have error send text to page
            String textSend = null;
            String pagenumber = request.getParameter("page");
            // page select now of paing
            int pageindex = 1;
            // number element in one paging
            int pagesize = 3;
            // count gallery in database
            int count = sql.countGallery();
            // pagecount total pages compared to total questions
            int pagecount = (count % pagesize == 0) ? count / pagesize : (count / pagesize) + 1;
            try {
                // ccheck page null
                if (pagenumber == null) {
                    pagenumber = "1";
                }
                pageindex = Integer.parseInt(pagenumber);
                // check page bigger pagecount
                if (pageindex > pagecount) {
                    textSend = "page not found";
                }
            } catch (Exception e) {
                textSend = "page not found";
            }
            request.setAttribute("textSend", textSend);
           
            request.setAttribute("pageindex", pageindex);
            
            request.setAttribute("pagecount", pagecount);
            
            ArrayList<Gallery> getAllGallery = sql.getAllGallery(pageindex, pagesize);
            request.setAttribute("getAllGallery", getAllGallery);
            request.setAttribute("check","home");
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
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
