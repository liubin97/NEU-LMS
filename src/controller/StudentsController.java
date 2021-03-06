package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import dao.StudentsDao;
import model.Students;

/**
 * Servlet implementation class StudentsController
 */
@WebServlet("/StudentsController")
public class StudentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
       // PrintWriter out = response.getWriter();

        if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
            StudentsDao dao = new StudentsDao();
            dao.deleteStudent(request.getParameter("id"));

            pagination(request,response);
        } else if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {

            StudentsDao dao = new StudentsDao();
            Students student = dao.getStudentById(request.getParameter("id"));

            request.setAttribute("student", student);
            request.getRequestDispatcher("newstudent.jsp?action=update").forward(request, response);

        } else if (request.getParameter("create") != null) {

            Students student = new Students();
            StudentsDao dao = new StudentsDao();

            student.setId(Integer.valueOf(request.getParameter("id")));
            student.setFirstName(request.getParameter("firstname"));
            student.setLastName(request.getParameter("lastname"));
            student.setEmail(request.getParameter("email"));
            student.setPhoneNo(request.getParameter("phoneno"));
            student.setAddress(request.getParameter("address"));

            student.setGender(Integer.valueOf(request.getParameter("gender")));
            student.setMs(Integer.valueOf(request.getParameter("ms")));
            student.setDept(request.getParameter("dept"));

//            out.println(student.getId() + " " + student.getGender() + " " + student.getDept());
            boolean flag = dao.addStudents(student);

            if (flag) {
                request.setAttribute("flag", "reg");
            } else {
                request.setAttribute("exists", "yes");
            }
            
            request.setAttribute("id", student.getId());
            pagination(request,response);

        } else if (request.getParameter("update") != null) {

            Students student = new Students();
            StudentsDao dao = new StudentsDao();

            student.setId(Integer.valueOf(request.getParameter("id")));
            student.setFirstName(request.getParameter("firstname"));
            student.setLastName(request.getParameter("lastname"));
            student.setEmail(request.getParameter("email"));
            student.setPhoneNo(request.getParameter("phoneno"));
            student.setAddress(request.getParameter("address"));

            student.setGender(Integer.valueOf(request.getParameter("gender")));
            student.setMs(Integer.valueOf(request.getParameter("ms")));
            student.setDept(request.getParameter("dept"));

//            System.out.println(student.getId() + " " + student.getMs()+ " " + student.getDept());
            boolean flag = dao.updateStudent(student);
            if (flag) {
                request.setAttribute("flag", "update");
            }
            request.setAttribute("id", student.getId());
            pagination(request,response);

        } else if(request.getParameter("searchbox") != null){ 
 
        	int page = 1;
            int recordsPerPage = 6;
            if(request.getParameter("page") != null)
            	page = Integer.parseInt(request.getParameter("page"));
            StudentsDao dao = new StudentsDao();
            String searchKey = request.getParameter("searchbox");
            List<Students> someStudents = dao.Search(searchKey, page-1, recordsPerPage);
            int noOfRecords = dao.getNoOfSearchRecords(searchKey);
           
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            System.out.println(noOfRecords);
            request.setAttribute("allStudents", someStudents);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            request.getRequestDispatcher("students.jsp").forward(request, response);
        
        } else {

        	pagination(request,response); 	
        }
	}
	
	private void pagination(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		int page = 1;
        int recordsPerPage = 6;
        if(request.getParameter("page") != null)
        	page = Integer.parseInt(request.getParameter("page"));
        StudentsDao dao = new StudentsDao();	
        List<Students> someStudents = dao.getSomeStudent(page-1, recordsPerPage);
        int noOfRecords = dao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        request.setAttribute("allStudents", someStudents);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("students.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
