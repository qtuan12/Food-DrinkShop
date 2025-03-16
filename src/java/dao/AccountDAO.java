package dao;

import context.DBContext;
import entity.Account;
import java.util.ArrayList;
import java.util.List;

/**
 * Lop AccountDAO chiu trach nhiem truy van va quan ly tai khoan trong database.
 */
public class AccountDAO extends DAO {

    // Phuong thuc cho phep dang nhap
    public Account login(String user, String pass) {
        String query = "select * from Accounts\n"
                + "where username = ?\n"
                + "and password = ?";
        try {
            con = new DBContext().connection; // Mo ket noi
            ps = con.prepareStatement(query); // Chuẩn bị truy vấn
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery(); // Thuc thi truy van
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra loi neu co
        }
        return null; // Tra ve null neu khong tim thay tai khoan
    }

    // Phuong thuc kiem tra tai khoan ton tai
    public Account checkAccountExist(String user) {
        String query = "select * from Accounts\n"
                + "where username = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Tra ve null neu khong tim thay tai khoan
    }

    // Phuong thuc dang ky tai khoan moi
    public void signup(String fullname, String user, String pass) {
        String query = "insert into Accounts\n"
                + "values (?,null,null,?,?,0,0)";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, user);
            ps.setString(3, pass);
            ps.executeUpdate(); // Thuc thi truy van
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Phuong thuc lay tat ca tai khoan
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Accounts";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; // Tra ve danh sach tai khoan
    }

    // Phuong thuc them tai khoan moi
    public void insertAccount(String fullname, String phone, String email, String user, String pass) {
        String query = "insert into Accounts\n"
                + "values (?,?,?,?,?,0,0)";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, user);
            ps.setString(5, pass);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Phuong thuc xoa tai khoan
    public void deleteAccount(int aid) {
        String query = "delete from Accounts\n"
                + "where id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, aid);
            ps.executeUpdate(); // Thuc thi truy van
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Phuong thuc lay tai khoan theo ID
    public Account getAccountByID(int aid) {
        String query = "select * from Accounts\n"
                + "where id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setInt(1, aid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Tra ve null neu khong tim thay tai khoan
    }

    // Phuong thuc cap nhat thong tin tai khoan
    public void editAccount(String fullname, String phone, String email, String user, String pass, int isSeller, int isAdmin, int id) {
        String query = "update Accounts\n"
                + "set fullname = ?,\n"
                + "phone = ?,\n"
                + "email = ?,\n"
                + "username = ?,\n"
                + "password = ?,\n"
                + "isSeller = ?,\n"
                + "isAdmin = ?\n"
                + "where id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, user);
            ps.setString(5, pass);
            ps.setInt(6, isSeller);
            ps.setInt(7, isAdmin);
            ps.setInt(8, id);
            ps.executeUpdate(); // Thuc thi truy van
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Phuong thuc cap nhat thong tin ho so
    public void editProfile(String fullname, String phone, String email, String user, String pass, int id) {
        String query = "update Accounts\n"
                + "set fullname = ?,\n"
                + "phone = ?,\n"
                + "email = ?,\n"
                + "username = ?,\n"
                + "password = ?,\n"
                + "isSeller = 0,\n"
                + "isAdmin = 0\n"
                + "where id = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, user);
            ps.setString(5, pass);
            ps.setInt(6, id);
            ps.executeUpdate(); // Thuc thi truy van
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
