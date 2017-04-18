package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import  dao.BooksDao;
import  dao.BorrowDao;
import  dao.StudentsDao;
import  model.Books;
import  model.Borrow;
import  model.Students;
import java.io.PrintWriter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 * Servlet implementation class BorrowController
 */
@WebServlet("/BorrowController")
public class BorrowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            if (request.getParameter("submit") != null) {
                String studentId = request.getParameter("studentid");
                String bookId = request.getParameter("bookid");

                BooksDao booksDao = new BooksDao();
                StudentsDao studentsDao = new StudentsDao();

                Books book = booksDao.getBookById(bookId);
                Students student = studentsDao.getStudentById(studentId);

                if (student.getId() == 0) {
                    out.println("找不到该生!!!");
                } else {
                    if (book.getSelfno() == 0) {
                        out.println("找不到该书!!!");
                    } else {
                        request.setAttribute("book", book);
                        request.setAttribute("student", student);

                        request.getRequestDispatcher("confirmborrow.jsp").forward(request, response);
                    } 
                }
            } else if (request.getParameter("confirm") != null) {

                Borrow borrow = new Borrow();
                borrow.setStudentId(request.getParameter("studentid"));
                borrow.setBookId(request.getParameter("bookid"));

                String borrowdateStr = request.getParameter("borrowdate");
                String returndateStr = request.getParameter("returndate");

                Date borrowDate = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(borrowdateStr);
                Date returnDate = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(returndateStr);

//                out.println(borrowDate + " " + returnDate);
                borrow.setBorrowDate(new java.sql.Date(borrowDate.getTime()));
                borrow.setReturnDate(new java.sql.Date(returnDate.getTime()));

                BorrowDao dao = new BorrowDao();
                boolean flag = dao.borrowBook(borrow);
//                if (flag) {
//                    out.println("Successfull!!!");
//                } else {
//                    out.println("Fail!!!");
//                }
                request.setAttribute("flag", flag);
                request.getRequestDispatcher("borrow.jsp").forward(request, response);
            } else if (request.getParameter("notconfirm") != null) {

                request.getRequestDispatcher("borrow.jsp").forward(request, response);
            }

        } catch (ParseException ex) {
            Logger.getLogger(BorrowController.class.getName()).log(Level.SEVERE, null, ex);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
