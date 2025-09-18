package utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class databaseconnection {

	static Connection con;
	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental","root","Tkrec@1234");
			
		}
		
		catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
	
	

