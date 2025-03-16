package dao;

import context.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DAO {

    protected Connection con = null;
    protected PreparedStatement ps = null;
    protected ResultSet rs = null;

    // Establishes a connection to the database
    protected void openConnection() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        }
    }

    // Closes the resources to prevent memory leaks
    protected void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace(); // Log any exceptions during resource closing
        }
    }
}
