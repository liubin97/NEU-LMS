
package   dao;

import   model.Borrow;
import   util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author GJC
 */
public class BorrowDao {

    final String TABLE = "borrow";
    private Connection connection = null;

    public BorrowDao() {
        connection = Database.getConnection();
    }

    public boolean borrowBook(Borrow borrow) {

        String sql = "INSERT into " + TABLE + "(student_id, book_id, borrow_date, return_date) "
                + "VALUES(?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, borrow.getStudentId());
            ps.setString(2, borrow.getBookId());
            ps.setDate(3, borrow.getBorrowDate());
            ps.setDate(4, borrow.getReturnDate());

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
            return false;
        }
        return true;
    }

    public Borrow getBorrowById(String borrowId) {

        Borrow borrow = new Borrow();
        String sql = "SELECT * from " + TABLE + " WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, borrowId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                borrow.setId(rs.getInt(1));
                borrow.setStudentId(rs.getString(2));
                borrow.setBookId(rs.getString(3));
                borrow.setBorrowDate(rs.getDate(4));
                borrow.setReturnDate(rs.getDate(5));
                borrow.setStatus(rs.getInt(6));
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }

        return borrow;
    }

    public List<Borrow> getAllBorrows() {

        List<Borrow> borrows = new ArrayList<>();
        String sql = "SELECT * from " + TABLE;

        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {
                Borrow borrow = new Borrow();

                borrow.setId(rs.getInt(1));
                borrow.setStudentId(rs.getString(2));
                borrow.setBookId(rs.getString(3));
                borrow.setBorrowDate(rs.getDate(4));
                borrow.setReturnDate(rs.getDate(5));
                borrow.setStatus(rs.getInt(6));

                borrows.add(borrow);
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }
        return borrows;
    }

    public List<Borrow> getAllBorrowsToReturn() {

        List<Borrow> borrows = new ArrayList<>();
        String sql = "SELECT * from " + TABLE + " WHERE status = 0";

        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {
                Borrow borrow = new Borrow();

                borrow.setId(rs.getInt(1));
                borrow.setStudentId(rs.getString(2));
                borrow.setBookId(rs.getString(3));
                borrow.setBorrowDate(rs.getDate(4));
                borrow.setReturnDate(rs.getDate(5));
                borrow.setStatus(rs.getInt(6));

                borrows.add(borrow);
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }
        return borrows;
    }
    
    public List<Borrow> search(String searchKey){
    	 List<Borrow> borrows = new ArrayList<>();
         String sql = "SELECT * from " + TABLE + " WHERE status = 0 " + "and ( id like '%" + searchKey + 
        		 "%' or student_id like '%" + searchKey + "%' or borrow_date like '%" + searchKey + 
        		 "%' or return_date like '%" + searchKey + "%')";

         try {
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql);

             while (rs.next()) {
                 Borrow borrow = new Borrow();

                 borrow.setId(rs.getInt(1));
                 borrow.setStudentId(rs.getString(2));
                 borrow.setBookId(rs.getString(3));
                 borrow.setBorrowDate(rs.getDate(4));
                 borrow.setReturnDate(rs.getDate(5));
                 borrow.setStatus(rs.getInt(6));

                 borrows.add(borrow);
             }
         } catch (Exception e) {
             System.out.println("EXCEPTION: " + e);
         }
         return borrows;
    }

    public boolean updateStatusById(int borrowId) {

        String sql = "UPDATE " + TABLE + " SET status = ? WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, 1);
            ps.setInt(2, borrowId);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
            return false;
        }
        return true;
    }

    public void closeConnection() {

        try {
            connection.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
