
package   dao;

import   model.Students;
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
public class StudentsDao {

    final String TABLE = "students";
    private Connection connection = null;

    public StudentsDao() {
        connection = Database.getConnection();
    }

    public boolean addStudents(Students student) {

        System.out.println(student.getFirstName() + " " + student.getDept());

        String sql = "INSERT into " + TABLE + "(id, first_name, last_name, email, phone_no, address, gender, ms, dept) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, student.getId());
            ps.setString(2, student.getFirstName());
            ps.setString(3, student.getLastName());
            ps.setString(4, student.getEmail());
            ps.setString(5, student.getPhoneNo());
            ps.setString(6, student.getAddress());
            ps.setInt(7, student.getGender());
            ps.setInt(8, student.getMs());
            ps.setString(9, student.getDept());

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
            return false;
        }
        return true;
    }

    public void deleteStudent(String studentId) {
        String sql = "DELETE from " + TABLE + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, studentId);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }
    }

    public List<Students> getAllStudents() {

        List<Students> students = new ArrayList<>();
        String sql = "SELECT * from " + TABLE;

        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {
                Students student = new Students();

                student.setId(rs.getInt(1));
                student.setFirstName(rs.getString(2));
                student.setLastName(rs.getString(3));
                student.setEmail(rs.getString(4));
                student.setPhoneNo(rs.getString(5));
                student.setAddress(rs.getString(6));
                student.setGender(rs.getInt(7));
                student.setMs(rs.getInt(8));
                student.setDept(rs.getString(9));

                students.add(student);
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }

        return students;
    }

    public Students getStudentById(String studentId) {

        Students student = new Students();
        String sql = "SELECT * from " + TABLE + " WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                student.setId(rs.getInt(1));
                student.setFirstName(rs.getString(2));
                student.setLastName(rs.getString(3));
                student.setEmail(rs.getString(4));
                student.setPhoneNo(rs.getString(5));
                student.setAddress(rs.getString(6));
                student.setGender(rs.getInt(7));
                student.setMs(rs.getInt(8));
                student.setDept(rs.getString(9));
            }

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }

        return student;
    }
    
    public List<Students> Search(String searchKey ,int pageNumber,int recordPerPage){
    	
    	List<Students> students = new ArrayList<>();

        
        String sql = "SELECT * from " + TABLE + " WHERE Id like '%" + searchKey + "%' or First_Name like '%" + searchKey + 
        		"%' or Last_Name like '%" + searchKey + "%' or Email like '%" + searchKey + 
        		"%' or Phone_No like '%" + searchKey + "%' or Address like '%" + searchKey + 
        		"%' or Dept like '%" + searchKey + "%' LIMIT ?, ?" ;
        

        try {
        	PreparedStatement ps = connection.prepareStatement(sql);
        	ps.setInt(1,pageNumber*recordPerPage);
        	ps.setInt(2, recordPerPage);
        	ResultSet rs = ps.executeQuery();
           
            while (rs.next()) {
            	Students student = new Students();
                student.setId(rs.getInt(1));
                student.setFirstName(rs.getString(2));
                student.setLastName(rs.getString(3));
                student.setEmail(rs.getString(4));
                student.setPhoneNo(rs.getString(5));
                student.setAddress(rs.getString(6));
                student.setGender(rs.getInt(7));
                student.setMs(rs.getInt(8));
                student.setDept(rs.getString(9));
                students.add(student);
            }

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }

        return students;
    }
    
    public List<Students> getSomeStudent(int pageNumber,int recordPerPage) {
    	List<Students> students = new ArrayList<>();
        String sql = "SELECT * from " + TABLE +" LIMIT ?, ?";
        
        try{
        	PreparedStatement ps = connection.prepareStatement(sql);
        	ps.setInt(1,pageNumber*recordPerPage);
        	ps.setInt(2, recordPerPage);
        	ResultSet rs = ps.executeQuery();
        	 while (rs.next()) {
                 Students student = new Students();

                 student.setId(rs.getInt(1));
                 student.setFirstName(rs.getString(2));
                 student.setLastName(rs.getString(3));
                 student.setEmail(rs.getString(4));
                 student.setPhoneNo(rs.getString(5));
                 student.setAddress(rs.getString(6));
                 student.setGender(rs.getInt(7));
                 student.setMs(rs.getInt(8));
                 student.setDept(rs.getString(9));

                 students.add(student);
             }
        	
        }catch(Exception e){
        	System.out.println("hell somestudent:"); 	
        	System.out.println("Exception" +e);
        }
        return students;
    }
    
    public int getNoOfRecords(){
    	String sql = "select count(1) from "+TABLE;
    	int noOfRecords = 0;
    	try{
    		 Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql);
             if(rs.next()) 
            	 noOfRecords =  rs.getInt(1);
    	}catch(Exception e){
    		System.out.println("hell: number");
    		System.out.println("Exception"+e);
    	}
    	return noOfRecords;
    }

    public boolean updateStudent(Students student) {
        String sql = "UPDATE " + TABLE
                + " SET id = ?, first_name = ?, last_name = ?, email = ?, phone_no = ?, address = ?, gender = ?, ms = ?, dept = ? WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, student.getId());
            ps.setString(2, student.getFirstName());
            ps.setString(3, student.getLastName());
            ps.setString(4, student.getEmail());
            ps.setString(5, student.getPhoneNo());
            ps.setString(6, student.getAddress());
            ps.setInt(7, student.getGender());
            ps.setInt(8, student.getMs());
            ps.setString(9, student.getDept());

            ps.setInt(10, student.getId());

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
