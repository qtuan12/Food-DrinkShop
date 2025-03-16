package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import entity.Item;
import entity.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO class for managing orders in the database.
 */
public class OrderDAO extends DBContext {

    // Connection variables
    public Connection con = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;

    // Adds a new order to the database
    public void addOrder(Account account, Cart cart) {
        LocalDate currentDate = LocalDate.now();
        String date = currentDate.toString();

        try {
            // Insert into Orders table
            String insertOrderSQL = "INSERT INTO [Orders] (aid, status, date, totalMoney) VALUES (?, ?, ?, ?)";
            ps = connection.prepareStatement(insertOrderSQL);
            ps.setInt(1, account.getId());
            ps.setInt(2, 1); // Assuming 1 means 'Pending'
            ps.setString(3, date);
            ps.setDouble(4, cart.getTotalMoney());
            ps.executeUpdate();

            // Retrieve the last inserted order ID
            String getLastOrderSQL = "SELECT TOP 1 id FROM [Orders] ORDER BY id DESC";
            ps = connection.prepareStatement(getLastOrderSQL);
            rs = ps.executeQuery();

            // Insert into OrderDetail table
            if (rs.next()) {
                int orderId = rs.getInt(1);
                for (Item item : cart.getItems()) {
                    String insertOrderDetailSQL = "INSERT INTO [OrderDetail] (oid, fid, quantity, price) VALUES (?, ?, ?, ?)";
                    ps = connection.prepareStatement(insertOrderDetailSQL);
                    ps.setInt(1, orderId);
                    ps.setInt(2, item.getFood().getId());
                    ps.setInt(3, item.getQuantity());
                    ps.setDouble(4, item.getPrice());
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            closeResources(); // Close resources to prevent memory leaks
        }
    }

    // Retrieves all orders from the database
    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM Orders";

        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            // Kiểm tra nếu có kết quả
            if (!rs.isBeforeFirst()) { // Nếu không có dòng nào
                System.out.println("No orders found.");
            }

            while (rs.next()) {
                list.add(new Order(rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getInt("status"),
                        rs.getDate("date"),
                        rs.getFloat("totalMoney")));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            closeResources(); // Close resources to prevent memory leaks
        }
        return list;
    }

    // Retrieves orders by account ID
    public List<Order> getOrderByAID(int aid) {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE aid = ?";

        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, aid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getInt("status"),
                        rs.getDate("date"),
                        rs.getFloat("totalMoney")));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            closeResources(); // Close resources to prevent memory leaks
        }
        return list;
    }

    // Retrieves a specific order by ID
    public Order getOrderByID(int oid) {
        String query = "SELECT * FROM Orders WHERE id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, oid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Order(rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getInt("status"),
                        rs.getDate("date"),
                        rs.getFloat("totalMoney"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            closeResources(); // Close resources to prevent memory leaks
        }
        return null; // Return null if no order found
    }

    // Deletes an order by ID
    public void deleteOrder(int oid) {
        String query = "DELETE FROM Orders WHERE id = ?";
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

    // Updates the status of an order
    public void editStatus(int status, int id) {
        String query = "UPDATE Orders SET status = ? WHERE id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            closeResources(); // Close resources to prevent memory leaks
        }
    }

    // Helper method to close resources
    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log any exceptions during resource closing
        }
    }


}
