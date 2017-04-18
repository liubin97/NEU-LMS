package controller;

import  dao.UsersDao;
import  model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getParameter("username").length() == 0) {
            request.setAttribute("errMsg", "用户名不能为空!!!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        if (request.getParameter("password").length() == 0) {
            request.setAttribute("errMsg", "密码不能为空!!!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }


            User user;
            UsersDao dao = new UsersDao();

            HttpSession session = request.getSession(true);

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                user = dao.getUserById(username);
                dao.closeConnection();

                if (user.getPassword().equals(password)) {
                    session.setAttribute("username", username);
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                } else {
                    request.setAttribute("errMsg", "密码错误!!!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (Exception e) {
                request.setAttribute("errMsg", "该用户不存在!!!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
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
