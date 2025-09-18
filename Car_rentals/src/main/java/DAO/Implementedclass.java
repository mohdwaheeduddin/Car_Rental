
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import models.bookingmodel;
import models.carmodels;
import models.loginmodel;
import models.registermodel;
import utility.databaseconnection;

public  class Implementedclass implements Database{
         String status="fail";
	

	@Override
	public String insertdata(registermodel rm) {
		try {
			Connection con=databaseconnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
				    "INSERT INTO user (firstname, lastname, password, email, phone) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, rm.getFirstname());
			ps.setString(2,rm.getLastname());
			ps.setString(3, rm.getPassword());
			ps.setString(4, rm.getEmail());
			ps.setString(5, rm.getPhone());
			
			int n=ps.executeUpdate();
			if(n>0) {
				status="success";
			}
		}
		catch(Exception e) {
			System.out.println(e);
					

				
		}
		
		return status;
	}

	@Override
	public loginmodel selectdata(loginmodel lm) {
	    loginmodel user = null;
	    try {
	        Connection con = databaseconnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT user_id, firstname, lastname, password FROM user WHERE firstname=? AND lastname=? AND password=?"
	        );
	        ps.setString(1, lm.getFirstname());
	        ps.setString(2, lm.getLastname());
	        ps.setString(3, lm.getPassword());
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            user = new loginmodel();
	            user.setUserid(rs.getInt("user_id"));   // ✅ IMPORTANT
	            user.setFirstname(rs.getString("firstname"));
	            user.setLastname(rs.getString("lastname"));
	            user.setPassword(rs.getString("password"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return user;
	}

	 @Override
	 public List<carmodels> getAllCars() {
		    List<carmodels> cars = new ArrayList<>();
		    try {
		        Connection con = databaseconnection.getConnection();
		        String query = "SELECT * FROM cars"; // Table name
		        PreparedStatement ps = con.prepareStatement(query);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            carmodels car = new carmodels();
		            car.setCid(rs.getString("car_id"));
		            car.setCname(rs.getString("cname"));
		            car.setSpecifications(rs.getString("specifications"));
		            car.setModel(rs.getString("model"));
		            car.setVariant(rs.getString("variant"));
		            car.setCostPerDay(rs.getString("cost_perday"));
		            car.setCarimage(rs.getString("carimage"));

		            cars.add(car);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return cars;
	 }

	 @Override
	public boolean bookedcar(bookingmodel bm) {
		 boolean status=false;
	
	
		try (Connection conn = databaseconnection.getConnection()) {
            String sql = "INSERT INTO bookings (user_id, car_id, days, from_date, to_date, license_no,totalprice) VALUES (?, ?, ?, ?, ?, ?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
           
            
            ps.setInt(1, bm.getUserId());
            ps.setInt(2, bm.getCarId());

           
            ps.setInt(3, bm.getDays());
            ps.setDate(4, java.sql.Date.valueOf(bm.getFromDate())); 
            ps.setDate(5, java.sql.Date.valueOf(bm.getToDate()));

            ps.setString(6, bm.getLicenseNo());
            
            ps.setDouble(7, bm.getTotalPrice());

           
            int  n=ps.executeUpdate();
			if(n>0) {
				status=true;
			}
		}
		catch(Exception e) {
			System.out.println(e);
					

				
		}
		
		return status;
		
		

		
	}

	

	
}
