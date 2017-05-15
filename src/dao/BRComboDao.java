package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.BRCombo;
import util.Database;

public class BRComboDao {

	final String TABLE = " borrow , books , students ";
	private Connection connection = null;
	
	public BRComboDao(){
		connection = Database.getConnection();
	}
	
	 public List<BRCombo> getAllBrc(){
		 List<BRCombo> allBrs = new ArrayList<>();
		 String sql = "select borrow.id , book_name , author_name , student_id , first_name ,last_name, borrow_date ,return_date ,status from "
		 		+ TABLE + "where borrow.book_id = books.isbn and borrow.student_id = students.id and borrow.status=0";
		 try {
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql);

             while (rs.next()) {
            	 BRCombo brc = new BRCombo();

					brc.setId(rs.getInt(1));
					brc.setTitle(rs.getString(2));
					brc.setAuthorName(rs.getString(3));

					brc.setStudentId(rs.getString(4));
					brc.setStudentName(rs.getString(5)+" "+rs.getString(6));

					brc.setBorrowDate(rs.getDate(7));
					brc.setReturnDate(rs.getDate(8));

					brc.setStatus(rs.getInt(9));
					allBrs.add(brc);
             }
         } catch (Exception e) {
             System.out.println("EXCEPTION: " + e);
         }
		 return allBrs;
	 }
	 
	 public List<BRCombo> search(String searchKey){
		 List<BRCombo> allBrs = new ArrayList<>();
		 String sql = "select borrow.id , book_name , author_name , student_id , first_name ,last_name, borrow_date ,return_date ,status from "
		 		+ TABLE + "where borrow.book_id = books.isbn and borrow.student_id = students.id and borrow.status=0 and("
		 				+ " borrow.id like '%" + searchKey +"%' or book_name like '%" + searchKey +"%' or author_name like "
		 						+ " '%" + searchKey +"%' or student_id like '%" + searchKey +"%' or first_name like '%" + searchKey +"%' "
		 								+ " or last_name like '%" + searchKey +"%' or borrow_date like binary '%" + searchKey +"%' "
		 										+ "or return_date like binary'%" + searchKey + "%')";
		 try {
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql);

             while (rs.next()) {
            	 BRCombo brc = new BRCombo();

					brc.setId(rs.getInt(1));
					brc.setTitle(rs.getString(2));
					brc.setAuthorName(rs.getString(3));

					brc.setStudentId(rs.getString(4));
					brc.setStudentName(rs.getString(5)+" "+rs.getString(6));

					brc.setBorrowDate(rs.getDate(7));
					brc.setReturnDate(rs.getDate(8));

					brc.setStatus(rs.getInt(9));
					allBrs.add(brc);
             }
         } catch (Exception e) {
             System.out.println("EXCEPTION: " + e);
         }
		 return allBrs;
	 }
	 
}
