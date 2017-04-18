package controller;

import dao.BooksDao;
import model.Books;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
            BooksDao dao = new BooksDao();
            dao.deleteBook(request.getParameter("isbn"));

            List<Books> allBooks = dao.getAllBooks();
            dao.closeConnection();
            request.setAttribute("allBooks", allBooks);
            request.getRequestDispatcher("books.jsp").forward(request, response);

        } else if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {

            BooksDao dao = new BooksDao();
            Books book = dao.getBookById(request.getParameter("isbn"));

            dao.closeConnection();
            request.setAttribute("book", book);
            request.getRequestDispatcher("newbook.jsp?action=update").forward(request, response);

        } else if (request.getParameter("create") != null) {

            Books book = new Books();
            BooksDao dao = new BooksDao();

            book.setIsbn(request.getParameter("isbn"));
            book.setBookname(request.getParameter("bookname"));
            book.setAuthorname(request.getParameter("authorname"));
            book.setCategory(request.getParameter("category"));
            book.setSelfno(Integer.valueOf(request.getParameter("selfno")));

//            out.println(student.getId() + " " + student.getGender() + " " + student.getDept());
            boolean flag = dao.addBooks(book);

            if (flag) {
                request.setAttribute("flag", "reg");
            } else {
                request.setAttribute("exists", "yes");
            }
            List<Books> allBooks = dao.getAllBooks();
            dao.closeConnection();
            request.setAttribute("allBooks", allBooks);
            request.setAttribute("isbn", book.getIsbn());
            request.getRequestDispatcher("books.jsp").forward(request, response);

        } else if (request.getParameter("update") != null) {

//            out.println("update");
            Books book = new Books();
            BooksDao dao = new BooksDao();

            book.setIsbn(request.getParameter("isbn"));
            book.setBookname(request.getParameter("bookname"));
            book.setAuthorname(request.getParameter("authorname"));
            book.setCategory(request.getParameter("category"));
            book.setSelfno(Integer.valueOf(request.getParameter("selfno")));

//            out.println(student.getId() + " " + student.getMs()+ " " + student.getDept());
            boolean flag = dao.updateBooks(book);
            if (flag) {
                request.setAttribute("flag", "update");
            }
            List<Books> allBooks = dao.getAllBooks();
            dao.closeConnection();
            request.setAttribute("allBooks", allBooks);
            request.setAttribute("isbn", book.getIsbn());
            request.getRequestDispatcher("books.jsp").forward(request, response);

        } else {
            System.out.println(request.getParameter("action"));
            BooksDao dao = new BooksDao();
            List<Books> allBooks = dao.getAllBooks();
            dao.closeConnection();
            request.setAttribute("allBooks", allBooks);
            request.getRequestDispatcher("books.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

        //PrintWriter out = response.getWriter();
		
	}

}
