package Project;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

//import com.mysql.cj.xdevapi.Statement;


 
@WebServlet("/adminaction")
public class adminaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public adminaction() {
        super();}
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataBaseConnect db = new DataBaseConnect();
		PrintWriter pw = response.getWriter();
		if(request.getParameter("addroom")!=null) {
		request.getRequestDispatcher("addroom.jsp").forward(request, response);}
		if(request.getParameter("Addrooms")!=null) {
		db.addroom(request.getParameter("type"),request.getParameter("price"));
        request.getRequestDispatcher("addedjsp.jsp").forward(request, response);
		}
			
		if(request.getParameter("report1")!=null) {
			request.getRequestDispatcher("report1.jsp").forward(request, response);}
		
		else if(request.getParameter("report2")!=null) {
			request.getRequestDispatcher("report2jsp.jsp").forward(request, response);}
		else if(request.getParameter("logout")!=null) {
			request.getRequestDispatcher("logout.jsp").forward(request, response);
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
