package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BRComboDao;
import dao.BooksDao;
import dao.BorrowDao;
import dao.ReturnDao;
import dao.StudentsDao;
import model.BRCombo;
import model.Books;
import model.Borrow;
import model.Return;
import model.Students;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class ReturnController
 */
@WebServlet("/ReturnController")
public class ReturnController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReturnController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			if (request.getParameter("fine") != null) {

				BorrowDao borrowDao = new BorrowDao();
				Borrow borrow = borrowDao.getBorrowById(request.getParameter("id"));

				String returnedDate = request.getParameter("returndate");
				Date returnDate = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(returnedDate);

				ReturnDao returnDao = new ReturnDao();
				Return returnObj = new Return();
				returnObj.setId(borrow.getId());
				returnObj.setStudentId(borrow.getStudentId());
				returnObj.setBookId(borrow.getBookId());
				returnObj.setReturnDate(new java.sql.Date(returnDate.getTime()));
				returnObj.setFine(Integer.valueOf(request.getParameter("fine")));
				//
				boolean flag = returnDao.addReturn(returnObj);
				if (flag) {
					flag = borrowDao.updateStatusById(Integer.valueOf(request.getParameter("id")));
					if (flag) {

						List<Borrow> allBorrows = borrowDao.getAllBorrowsToReturn();

						BooksDao booksDao = new BooksDao();
						StudentsDao studentsDao = new StudentsDao();

						List<BRCombo> allBr = new ArrayList<>();

						for (Borrow b : allBorrows) {

							Books book = booksDao.getBookById(b.getBookId());
							Students student = studentsDao.getStudentById(b.getStudentId());

							BRCombo brc = new BRCombo();

							brc.setId(b.getId());
							brc.setTitle(book.getBookname());
							brc.setAuthorName(book.getAuthorname());

							brc.setStudentId(b.getStudentId());
							brc.setStudentName(student.getFirstName() + " " + student.getLastName());

							brc.setBorrowDate(b.getBorrowDate());
							brc.setReturnDate(b.getReturnDate());

							brc.setStatus(b.getStatus());

							allBr.add(brc);
						}

						request.setAttribute("allBr", allBr);
						request.setAttribute("size", allBr.size());
						request.setAttribute("flag", flag);
						request.getRequestDispatcher("return.jsp").forward(request, response);
					} else {
						out.println("Error 1 !!!");
					}
				} else {
					out.println("Error 2 !!!");
				}

			} else if (request.getParameter("searchbox") != null) {

//				BorrowDao borrowDao = new BorrowDao();
//				BooksDao booksDao = new BooksDao();
//				StudentsDao studentsDao = new StudentsDao();
//				String searchKey = request.getParameter("searchbox");
//				List<Borrow> allBorrows = borrowDao.search(searchKey);
//				List<Books> allBooks = booksDao.search(searchKey);
//				List<Students> allStudents = studentsDao.Search(searchKey);
//				List<BRCombo> allBr = new ArrayList<>();
//				for (Borrow b : allBorrows) {
//					for(Books book : allBooks){
//						if(book.getIsbn().equals(b.getBookId())){
//							for(Students student : allStudents){
//								if(student.getId() == Integer.parseInt(b.getStudentId())){
//									BRCombo brc = new BRCombo();
//
//									brc.setId(b.getId());
//									brc.setTitle(book.getBookname());
//									brc.setAuthorName(book.getAuthorname());
//
//									brc.setStudentId(b.getStudentId());
//									brc.setStudentName(student.getFirstName() + " " + student.getLastName());
//
//									brc.setBorrowDate(b.getBorrowDate());
//									brc.setReturnDate(b.getReturnDate());
//
//									brc.setStatus(b.getStatus());
//
//									allBr.add(brc);
//								}
//							}
//						}
//						
//					}
////
//					Books book = booksDao.getBookById(b.getBookId());
//					Students student = studentsDao.getStudentById(b.getStudentId());
//
//					BRCombo brc = new BRCombo();
//
//					brc.setId(b.getId());
//					brc.setTitle(book.getBookname());
//					brc.setAuthorName(book.getAuthorname());
//
//					brc.setStudentId(b.getStudentId());
//					brc.setStudentName(student.getFirstName() + " " + student.getLastName());
//
//					brc.setBorrowDate(b.getBorrowDate());
//					brc.setReturnDate(b.getReturnDate());

//					brc.setStatus(b.getStatus());
//
//					allBr.add(brc);
//				}
				//System.out.println(allBr.size());
				BRComboDao brcDao = new BRComboDao();
				if (request.getParameter("searchbox").length() == 0) {
					request.setAttribute("errMsg", "²»ÄÜÎª¿Õ!!!");
					request.getRequestDispatcher("books.jsp").forward(request, response);
				}
				String searchKey = request.getParameter("searchbox");
				
				List<BRCombo> allBr = brcDao.search(searchKey);
				brcDao.closeConnection();

				request.setAttribute("allBr", allBr);
				request.setAttribute("size", allBr.size());
				request.getRequestDispatcher("return.jsp").forward(request, response);

			} else {
//				BorrowDao borrowDao = new BorrowDao();
//				List<Borrow> allBorrows = borrowDao.getAllBorrowsToReturn();
//				BooksDao booksDao = new BooksDao();
//				StudentsDao studentsDao = new StudentsDao();
//
//				List<BRCombo> allBr = new ArrayList<>();
//
//				for (Borrow b : allBorrows) {
//
//					Books book = booksDao.getBookById(b.getBookId());
//					Students student = studentsDao.getStudentById(b.getStudentId());
//
//					BRCombo brc = new BRCombo();
//
//					brc.setId(b.getId());
//					brc.setTitle(book.getBookname());
//					brc.setAuthorName(book.getAuthorname());
//
//					brc.setStudentId(b.getStudentId());
//					brc.setStudentName(student.getFirstName() + " " + student.getLastName());
//
//					brc.setBorrowDate(b.getBorrowDate());
//					brc.setReturnDate(b.getReturnDate());
//
//					brc.setStatus(b.getStatus());
//
//					allBr.add(brc);
//				}
				BRComboDao brcDao = new BRComboDao();
				List<BRCombo> allBr = brcDao.getAllBrc();
				brcDao.closeConnection();

				request.setAttribute("allBr", allBr);
				request.setAttribute("size", allBr.size());
				request.getRequestDispatcher("return.jsp").forward(request, response);
			}
		} catch (ParseException ex) {
			Logger.getLogger(ReturnController.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
