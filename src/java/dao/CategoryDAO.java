package dao;

import context.DBContext;
import entity.Category;
import java.util.ArrayList;
import java.util.List;

/**
 * Lop CategoryDAO chiu trach nhiem truy van va quan ly danh muc trong database.
 */
public class CategoryDAO extends DAO {

    // Phuong thuc lay danh sach tat ca danh muc
    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Categories"; // Truy van lay tat ca danh muc
        try {
            con = new DBContext().connection; // Mo ket noi
            ps = con.prepareStatement(query); // Chuẩn bị truy vấn
            rs = ps.executeQuery(); // Thuc thi truy van
            while (rs.next()) {
                // Them danh muc vao danh sach
                list.add(new Category(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra loi neu co
        } finally {
            closeResources(); // Dong ket noi va cac tai nguyen
        }
        return list; // Tra ve danh sach danh muc
    }
}
