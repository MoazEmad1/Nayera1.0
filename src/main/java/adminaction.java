

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


 
@WebServlet("/adminaction")
public class adminaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public adminaction() {
        super();}
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataBaseConnect db = new DataBaseConnect();
		if(request.getParameter("addroom")!=null) {
		request.getRequestDispatcher("addroom.jsp").forward(request, response);}
		if(request.getParameter("Addrooms")!=null) {
		db.addroom(request.getParameter("type"),request.getParameter("price"));
        request.getRequestDispatcher("addedjsp.jsp").forward(request, response);
		}
			
		//if(request.getParameter("report")!=null)
		  //    request.getRequestDispatcher("showreport.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
