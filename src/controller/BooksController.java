package controller;

import dao.BooksDao;
import dao.StudentsDao;
import model.Books;
import model.Students;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Servlet implementation class BooksController
 */
@WebServlet("/BooksController")
public class BooksController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BooksController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
			BooksDao dao = new BooksDao();
			dao.deleteBook(request.getParameter("isbn"));			
			pagination(request, response);

		} 
		else if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {

			BooksDao dao = new BooksDao();
			Books book = dao.getBookById(request.getParameter("isbn"));
			dao.closeConnection();
			request.setAttribute("book", book);
			request.getRequestDispatcher("newbook.jsp?action=update").forward(request, response);

		} 
		else if (request.getParameter("create") != null) {

			Books book = new Books();
			BooksDao dao = new BooksDao();
			book.setIsbn(request.getParameter("isbn"));
			book.setBookname(request.getParameter("bookname"));
			book.setAuthorname(request.getParameter("authorname"));
			book.setCategory(request.getParameter("category"));
			book.setSelfno(Integer.valueOf(request.getParameter("selfno")));
			boolean flag = dao.addBooks(book);

			if (flag) {
				request.setAttribute("flag", "reg");
			} else {
				request.setAttribute("exists", "yes");
			}
			request.setAttribute("isbn", book.getIsbn());
			pagination(request, response);

		} 
		else if (request.getParameter("update") != null) {
			Books book = new Books();
			BooksDao dao = new BooksDao();
			book.setIsbn(request.getParameter("isbn"));
			book.setBookname(request.getParameter("bookname"));
			book.setAuthorname(request.getParameter("authorname"));
			book.setCategory(request.getParameter("category"));
			book.setSelfno(Integer.valueOf(request.getParameter("selfno")));
			boolean flag = dao.updateBooks(book);
			if (flag) {
				request.setAttribute("flag", "update");
			}
			request.setAttribute("isbn", book.getIsbn());
			pagination(request, response);

		} 
		else if (request.getParameter("searchbox") != null) {
			String searchKey = request.getParameter("searchbox");
			int page = 1;
			int recordsPerPage = 6;
			if (request.getParameter("page") != null)
				page = Integer.parseInt(request.getParameter("page"));
			BooksDao dao = new BooksDao();
			List<Books> someBooks = dao.search(searchKey, page - 1, recordsPerPage);
			int noOfRecords = dao.getNoOfSearchRecords(searchKey);
			int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			request.setAttribute("allBooks", someBooks);
			request.setAttribute("noOfPages", noOfPages);
			request.setAttribute("currentPage", page);
			request.getRequestDispatcher("books.jsp").forward(request, response);

		} 
		else {
			pagination(request, response);

		}
	}

	private void pagination(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = 1;
		int recordsPerPage = 6;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		BooksDao dao = new BooksDao();
		List<Books> someBooks = dao.getSomebook(page - 1, recordsPerPage);
		int noOfRecords = dao.getNoOfRecords();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("allBooks", someBooks);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		request.getRequestDispatcher("books.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		// PrintWriter out = response.getWriter();

	}

}
