package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.carmodels;
import models.loginmodel;

import java.io.IOException;
import java.util.List;

import DAO.Implementedclass;


@WebServlet("/logincontroller")
public class logincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public logincontroller() {
      
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String password=request.getParameter("password");
	
		
		
		loginmodel lm=new loginmodel();
		lm.setFirstname(firstname);
		lm.setLastname(lastname);
		lm.setPassword(password);
		
		
		Implementedclass ic=new Implementedclass();
		loginmodel loggedInUser =  ic.selectdata(lm);    

		  
		
		if (loggedInUser != null) {
		    HttpSession session = request.getSession();
		    session.setAttribute("user", loggedInUser);  // ✅ store the DB user (has correct userId)

		    List<carmodels> carList = ic.getAllCars();
		    request.setAttribute("carList", carList);

		    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		    rd.forward(request, response);
		} else {
		    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		    rd.include(request, response);
		}
	}}


	



