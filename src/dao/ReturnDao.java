
package  dao;

import  model.Books;
import  model.Return;
import  util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author GJC
 */
public class ReturnDao {

    final String TABLE = "returns";
    private Connection connection = null;

    public ReturnDao() {
        connection = Database.getConnection();
    }

    public boolean addReturn(Return returnObj) {

        String sql = "INSERT into " + TABLE + "(id, `student id`, `book id`, `return date`, fine) "
                + "VALUES(?, ?, ?, ?, ?)";
        try {
            BorrowDao dao = new BorrowDao();

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, returnObj.getId());
            ps.setString(2, returnObj.getStudentId());
            ps.setString(3, returnObj.getBookId());
            ps.setDate(4, returnObj.getReturnDate());
            ps.setInt(5, returnObj.getFine());

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
