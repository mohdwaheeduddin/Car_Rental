package DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utility.databaseconnection;
public class admindao {




    public boolean validateAdmin(String username, String password) {
        try (Connection con = databaseconnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM admins WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            return rs.next(); // ✅ true if admin exists
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
