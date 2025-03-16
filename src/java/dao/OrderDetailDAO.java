package dao;

import context.DBContext;
import entity.OrderDetail;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO class for managing order details in the database.
 */
public class OrderDetailDAO extends DAO {

    // Retrieves all order details from the database.
    public List<OrderDetail> getAllOrderDetail() {
        List<OrderDetail> list = new ArrayList<>();
        String query = "SELECT * FROM OrderDetail";

        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                // Create an OrderDetail object for each row in the result set
                list.add(new OrderDetail(rs.getInt("oid"), // Order ID
                        rs.getInt("fid"), // Food ID
                        rs.getInt("quantity"), // Quantity
                        rs.getDouble("price"))); // Price
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            closeResources(); // Close resources to prevent memory leaks
        }
        return list;
    }

    // Retrieves order details by Order ID.
    public List<OrderDetail> getOrderDetailByOID(int oid) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "SELECT * FROM OrderDetail WHERE oid = ?";

        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, oid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt("oid"), // Order ID
                        rs.getInt("fid"), // Food ID
                        rs.getInt("quantity"), // Quantity
                        rs.getDouble("price"))); // Price
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            closeResources(); // Close resources to prevent memory leaks
        }
        return list;
    }

    // Deletes all order details associated with a specific Order ID.
    public void deleteOrderDetail(int oid) {
        String query = "DELETE FROM OrderDetail WHERE oid = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, oid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            closeResources(); // Close resources to prevent memory leaks
        }
    }

    // Deletes a specific food item from an order detail based on Food ID and Order ID.
    public void deleteFoodInOrderDetail(int fid, int oid) {
        String query = "DELETE FROM OrderDetail WHERE fid = ? AND oid = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, fid);
            ps.setInt(2, oid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            closeResources(); // Close resources to prevent memory leaks
        }
    }

  

    // Main method for testing the DAO functionality.
    public static void main(String[] args) {
        OrderDetailDAO odd = new OrderDetailDAO();
        List<OrderDetail> list = odd.getOrderDetailByOID(4);
        for (OrderDetail orderDetail : list) {
            System.out.println(orderDetail.toString());
        }
    }
}
