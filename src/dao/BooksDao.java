
package  dao;

import  model.Books;
import  model.Students;
import  util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GJC
 */
public class BooksDao {

    final String TABLE = "books";
    private Connection connection = null;

    public BooksDao() {
        connection = Database.getConnection();
    }

    public boolean addBooks(Books book) {

        String sql = "INSERT into " + TABLE + "(isbn, book_name, author_name, category, self_no) "
                + "VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, book.getIsbn());
            ps.setString(2, book.getBookname());
            ps.setString(3, book.getAuthorname());
            ps.setString(4, book.getCategory());
            ps.setInt(5, book.getSelfno());

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
            return false;
        }
        return true;
    }

    public void deleteBook(String bookId) {
        String sql = "DELETE from " + TABLE + " WHERE isbn = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, bookId);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }
    }

    public List<Books> getAllBooks() {
   
        List<Books> books = new ArrayList<>();
        String sql = "SELECT * from " + TABLE;

        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {
           
                Books book = new Books();

                book.setIsbn(rs.getString(1));
                book.setBookname(rs.getString(2));
                book.setAuthorname(rs.getString(3));
                book.setCategory(rs.getString(4));
                book.setSelfno(rs.getInt(5));

                books.add(book);
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }

        return books;
    }
    public List<Books> search(String searchKey , int pageNumber,int recordPerPage){
    	List<Books> books = new ArrayList<>();
        String sql = "SELECT * from " + TABLE + " where isbn like '%" + searchKey + "%' or book_name like '%" + searchKey +
        		"%' or author_name like '%" + searchKey + "%' or category like '%" + searchKey +
        		"%' or self_no like '%"+ searchKey +"%' LIMIT ?, ?";

        try {
        	PreparedStatement ps = connection.prepareStatement(sql);
        	ps.setInt(1,pageNumber*recordPerPage);
        	ps.setInt(2, recordPerPage);
        	ResultSet rs = ps.executeQuery();

            while (rs.next()) {
           
                Books book = new Books();

                book.setIsbn(rs.getString(1));
                book.setBookname(rs.getString(2));
                book.setAuthorname(rs.getString(3));
                book.setCategory(rs.getString(4));
                book.setSelfno(rs.getInt(5));

                books.add(book);
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }

        return books;
    	
    }
    
    public List<Books> getSomebook(int pageNumber,int recordPerPage) {
   	 List<Books> books = new ArrayList<>();
       String sql = "SELECT * from " + TABLE +" LIMIT ?, ?";
       
       try{
       	PreparedStatement ps = connection.prepareStatement(sql);
       	ps.setInt(1,pageNumber*recordPerPage);
       	ps.setInt(2, recordPerPage);
       	ResultSet rs = ps.executeQuery();
       	 while (rs.next()) {
       		 Books book = new Books();

                book.setIsbn(rs.getString(1));
                book.setBookname(rs.getString(2));
                book.setAuthorname(rs.getString(3));
                book.setCategory(rs.getString(4));
                book.setSelfno(rs.getInt(5));

                books.add(book);
            }
       	
       }catch(Exception e){
       	System.out.println("hell somebook:"); 	
       	System.out.println("Exception" +e);
       }
       return books;
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
   
   public int getNoOfSearchRecords(String searchKey){
	   	String sql = "select count(1) from "+TABLE+ " where isbn like '%" + searchKey + "%' or book_name like '%" + searchKey +
        		"%' or author_name like '%" + searchKey + "%' or category like '%" + searchKey +
        		"%' or self_no like '%"+ searchKey +"%' ";
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

    public Books getBookById(String bookId) {

        Books book = new Books();
        String sql = "SELECT * from " + TABLE + " WHERE isbn = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, bookId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                book.setIsbn(rs.getString(1));
                book.setBookname(rs.getString(2));
                book.setAuthorname(rs.getString(3));
                book.setCategory(rs.getString(4));
                book.setSelfno(rs.getInt(5));
            }

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }

        return book;
    }
    
    public Books getBookByName(String bookName) {

        Books book = new Books();
        String sql = "SELECT * from " + TABLE + " WHERE book_name = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, bookName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                book.setIsbn(rs.getString(1));
                book.setBookname(rs.getString(2));
                book.setAuthorname(rs.getString(3));
                book.setCategory(rs.getString(4));
                book.setSelfno(rs.getInt(5));
            }

        } catch (Exception e) {
            System.out.println("EXCEPTION: " + e);
        }

        return book;
    } 

    public boolean updateBooks(Books book) {
        String sql = "UPDATE " + TABLE
                + " SET isbn = ?, book_name = ?, author_name = ?, category = ?, self_no = ? WHERE isbn = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, book.getIsbn());
            ps.setString(2, book.getBookname());
            ps.setString(3, book.getAuthorname());
            ps.setString(4, book.getCategory());
            ps.setInt(5, book.getSelfno());
            ps.setString(6, book.getIsbn());

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
        } catch (SQLException ex) {
            Logger.getLogger(BooksDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
