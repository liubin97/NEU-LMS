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

				//System.out.println(allBr.size());
				
				String searchKey = request.getParameter("searchbox");
				
				
				int page = 1;
		        int recordsPerPage = 6;
		        if(request.getParameter("page") != null)
		        page = Integer.parseInt(request.getParameter("page"));
		        BRComboDao dao = new BRComboDao();	
		        List<BRCombo> someBrcs = dao.search(searchKey,page-1, recordsPerPage);
		        int noOfRecords = dao.getNoOfRecords();
		        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		        request.setAttribute("allBr", someBrcs);
		        request.setAttribute("noOfPages", noOfPages);
		        request.setAttribute("currentPage", page);
		        request.getRequestDispatcher("return.jsp").forward(request, response);
			} else {
//
//				BRComboDao brcDao = new BRComboDao();
//				List<BRCombo> allBr = brcDao.getAllBrc();
//				brcDao.closeConnection();
//
//				request.setAttribute("allBr", allBr);
//				request.setAttribute("size", allBr.size());
//				request.getRequestDispatcher("return.jsp").forward(request, response);
				pagination(request,response);
			}
		} catch (ParseException ex) {
			Logger.getLogger(ReturnController.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	
	private void pagination(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		int page = 1;
        int recordsPerPage = 6;
        if(request.getParameter("page") != null)
        page = Integer.parseInt(request.getParameter("page"));
        BRComboDao dao = new BRComboDao();	
        List<BRCombo> someBrcs = dao.getSomeBrc(page-1, recordsPerPage);
        int noOfRecords = dao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        request.setAttribute("allBr", someBrcs);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("return.jsp").forward(request, response);
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
