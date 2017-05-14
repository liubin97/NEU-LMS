
package  dao;

import  model.Books;
import  model.Return;
import  util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
    
    public Return getReturnByStdId(String studentId){
    	Return ret = new Return();
    	String sql = "SELECT * from " + TABLE + " WHERE `student id` = ?";
    	try{
    		PreparedStatement ps = connection.prepareStatement(sql);
    		ps.setString(1, studentId);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()){
    			ret.setId(rs.getInt(1));
            	ret.setStudentId(rs.getString(2));
            	ret.setBookId(rs.getString(3));
            	ret.setReturnDate(rs.getDate(4));
            	ret.setFine(rs.getInt(5));
    		}
    	}catch(Exception e){
    		System.out.println("EXCEPTION: " + e);
    	}
     	//System.out.println(ret.getId());
    	return ret;
    }
    
    public Return getReturnById(int id){
    	Return ret = new Return();
    	String sql = "SELECT * from " + TABLE + " WHERE isbn =" + id;
    	try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
            	ret.setId(rs.getInt(1));
            	ret.setStudentId(rs.getString(2));
            	ret.setBookId(rs.getString(3));
            	ret.setReturnDate(rs.getDate(4));
            	ret.setFine(rs.getInt(5));
            	
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }
   
        return ret;
    
    }

    public void closeConnection() {

        try {
            connection.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
