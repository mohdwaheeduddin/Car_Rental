package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import DAO.Implementedclass;
import models.carmodels;

@WebServlet("/carcontroller")
public class carcontroller extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Implementedclass dao = new Implementedclass();
        List<carmodels> carList = dao.getAllCars();

       
       
        request.setAttribute("carList", carList);  // Set the attribute
        request.getRequestDispatcher("booking.jsp").forward(request, response);  // Forward to JSP
    }
}
