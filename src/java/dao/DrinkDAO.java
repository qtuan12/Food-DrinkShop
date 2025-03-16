package dao;

import context.DBContext;
import entity.Drink;
import java.util.ArrayList;
import java.util.List;

/**
 * Lop FoodDAO chiu trach nhiem truy van va quan ly cac thuc an trong database.
 */
public class DrinkDAO extends DAO {

    // Phuong thuc lay danh sach tat ca thuc an
    public List<Drink> getAllFoodByCid(int index) {
        List<Drink> list = new ArrayList<>();
        int startRow = index * 3 - 2;
        int endRow = index * 3;
        String query = "select * from ( select ROW_NUMBER() over ( order by id asc ) as r ,* from Drinks ) as x where r between ?  and ?";
        try {
            con = new DBContext().connection; // Mo ket noi
            ps = con.prepareStatement(query); // Chuẩn bị truy vấn
            ps.setInt(1, startRow);
            ps.setInt(2, endRow);
            rs = ps.executeQuery(); // Thuc thi truy van
            while (rs.next()) {
                list.add(new Drink(rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra loi neu co
        } finally {
            closeResources(); // Dong ket noi va cac tai nguyen
        }
        return list; // Tra ve danh sach thuc an
    }

    public List<Drink> getAllFood() {
        List<Drink> list = new ArrayList<>();
        String query = "select * from Drinks"; // where Drinks.price >100 điều kiện đẻ hiện thị ra đồ ăn
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Drink(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    // Phuong thuc lay thuc an theo ID danh muc moi lay theo phan trang
    public List<Drink> getFoodByCID(int cid, int index) {
        List<Drink> list = new ArrayList<>();
        String query = "select * from ( select ROW_NUMBER() over ( order by id asc ) as r ,"
                + "* from Drinks  where Drinks.categoryID = ?"
                + ") as x where r between ?*3 - 2  and ?*3";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            ps.setInt(2, index);
            ps.setInt(3, index);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Drink(rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }
//
//    // Phuong thuc lay thuc an theo ID danh muc cu 

    public List<Drink> getFoodByCID(int cid) {
        List<Drink> list = new ArrayList<>();
        String query = "select * from Drinks where categoryID = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Drink(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }

    // Phuong thuc lay thuc an theo ID
    public Drink getFoodByID(int fid) {
        String query = "select * from  Drinks where id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, fid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Drink(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return null; // Tra ve null neu khong tim thay
    }

    // Phuong thuc tim thuc an theo ten cu 
//    public List<Drink> getFoodByName(String txtSearch, int index ) {
//        List<Drink> list = new ArrayList<>();
//        String query = "select * from Drinks where name like ?";
//        try {
//            con = new DBContext().connection;
//            ps = con.prepareStatement(query);
//            ps.setString(1, "%" + txtSearch + "%");
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Drink(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getDouble(5),
//                        rs.getInt(6),
//                        rs.getInt(7)));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeResources();
//        }
//        return list;
//    }
    // ten moi 
    public List<Drink> getFoodByName(String txtSearch, int index) {
        List<Drink> list = new ArrayList<>();
        String query = "     select * from ( select ROW_NUMBER() over ( order by id asc ) as r ,"
                + "* from Drinks  where Drinks.name LIKE ? ) as x"
                + " where r between ?*3 - 2  and ?*3";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, index);
            ps.setInt(3, index);

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Drink(rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }

    // Phuong thuc xoa thuc an theo ID
    public void deleteFood(int fid) {
        String query = "delete from Drinks where id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, fid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    // Phuong thuc them thuc an
    public void insertFood(String name, String description, String image, double price, int categoryID, int quantity) {
        String query = "insert into Drinks values (?,?,?,?,?,?)";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, image);
            ps.setDouble(4, price);
            ps.setInt(5, categoryID);
            ps.setInt(6, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    // Phuong thuc cap nhat thuc an
    public void editFood(String name, String description, String image, double price, int categoryID, int quantity, int id) {
        String query = "update Drinks set name = ?, description = ?, image = ?, price = ?, categoryID = ?, quantity = ? where id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, image);
            ps.setDouble(4, price);
            ps.setInt(5, categoryID);
            ps.setInt(6, quantity);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    // phuog thuc dem 
    public int count(int cateID) {
        int count = 0; // Initialize count variable

        try {
            con = new DBContext().connection; // Open connection
            String query;

            // Nếu cateID là 0, đếm tất cả các bản ghi
            if (cateID == 0) {
                query = "SELECT COUNT(*) FROM Drinks"; // Đếm tất cả
            } else {
                query = "SELECT COUNT(*) FROM Drinks WHERE Drinks.categoryID = ?"; // Đếm theo categoryID
            }

            ps = con.prepareStatement(query);

            // Chỉ thiết lập tham số khi cateID không phải là 0
            if (cateID != 0) {
                ps.setInt(1, cateID); // Set parameter for categoryID
            }

            rs = ps.executeQuery(); // Execute query
            if (rs.next()) { // Check if result set has data
                count = rs.getInt(1); // Get the count
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for debugging
        } finally {
            closeResources(); // Ensure resources are closed
        }

        return count; // Return the count
    }

    public int countByName(String name) {
        int count = 0;
        String query = "SELECT COUNT(*) FROM Drinks WHERE name LIKE ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return count;
    }
    

}
