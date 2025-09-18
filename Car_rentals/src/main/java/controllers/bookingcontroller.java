package controllers;

import java.io.IOException;
import java.time.LocalDate;
import DAO.Implementedclass;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.bookingmodel;
import models.loginmodel;

@WebServlet("/bookingcontroller")
public class bookingcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public bookingcontroller() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		try {
			// ✅ Get values from booking.jsp form

			String fromDatestr = request.getParameter("from_date");
			String toDatestr = request.getParameter("to_date");
			String licenseNo = request.getParameter("license_no");

			LocalDate fromDate = null;
			LocalDate toDate = null;
			int days = 0;

			if (fromDatestr != null && !fromDatestr.isEmpty()) {
				fromDate = LocalDate.parse(fromDatestr);
			}
			if (toDatestr != null && !toDatestr.isEmpty()) {
				toDate = LocalDate.parse(toDatestr);
			}

			// ✅ Calculate days in backend
			if (fromDate != null && toDate != null) {
				days = (int) java.time.temporal.ChronoUnit.DAYS.between(fromDate, toDate);
				if (days <= 0) {
					request.setAttribute("message", "To Date must be after From Date.");
					RequestDispatcher rd = request.getRequestDispatcher("booking.jsp");
					rd.forward(request, response);
					return;
				}
			}

			// ✅ Get logged-in user
			loginmodel user = (loginmodel) session.getAttribute("user");
			if (user == null) {
				response.sendRedirect("login.jsp");
				return;
			}
			int userId = user.getUserid();
			
			System.out.println("===========1");

			// ✅ Get selected carId (hidden field in booking.jsp)
			int carId = Integer.parseInt(request.getParameter("carId"));
			
			

			// ✅ Calculate total price instead of trusting input
			double pricePerDay = Double.parseDouble(request.getParameter("pricePerDay"));
			System.out.println(userId);
			double totalPrice = days * pricePerDay;
			// ✅ Fill booking model
			System.out.println("===========1");
			
			
			bookingmodel bm = new bookingmodel();
			bm.setUserId(userId);
			bm.setCarId(carId);
			bm.setDays(days);
			bm.setFromDate(fromDate);
			bm.setToDate(toDate);
			bm.setLicenseNo(licenseNo);
			bm.setTotalPrice(totalPrice);
			
			System.out.println(bm);

			// ✅ Call DAO method to insert booking
			Implementedclass ic = new Implementedclass();
			boolean status = ic.bookedcar(bm);

			if (status) {
				request.setAttribute("status", "success");
				RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("message", "Booking Failed. Try again.");
				RequestDispatcher rd = request.getRequestDispatcher("booking.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Error while processing booking: " + e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("booking.jsp");
			rd.forward(request, response);
		}
	}
}
