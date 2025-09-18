package controllers;

import DAO.admindao;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admincontroller")
public class admincontroller extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        admindao dao = new admindao();
        boolean isValid = dao.validateAdmin(username, password);

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", username); // store only username
            response.sendRedirect("admindashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid Username or Password");
            request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
        }
    }
}
