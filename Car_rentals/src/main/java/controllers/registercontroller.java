package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.registermodel;

import java.io.IOException;

import DAO.Implementedclass;


@WebServlet("/registercontroller")
public class registercontroller extends HttpServlet {
	
    
    public registercontroller() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String phone =request.getParameter("phone");
		
		registermodel rm=new registermodel();
		
		rm.setFirstname(firstname);
		rm.setLastname(lastname);
		rm.setPassword(password);
		rm.setEmail(email);
		rm.setPhone(phone);
		
		System.out.println(rm);
		
		Implementedclass ic=new Implementedclass();
		String status=ic.insertdata(rm);
		System.out.println(status);
		
		if(status.equals("success")){
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			   rd.forward(request, response);
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");
			  rd.include(request, response);
		}
		
	}

}
