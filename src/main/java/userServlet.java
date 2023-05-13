

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userServlet")
public class userServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if(request.getParameter("login")!=null)
			request.getRequestDispatcher("login.jsp").forward(request, response);
		else if(request.getParameter("register")!=null)
			request.getRequestDispatcher("registration.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html");
		DataBaseConnect db=new DataBaseConnect();
		PrintWriter pw = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
	    if(email.equals("admin") &&  password.equals("admin")) {
			request.getRequestDispatcher("admin.jsp").forward(request, response);
			
		}
	    else if(request.getParameter("signupcheck")!=null) {
		db.storeCustomer(request.getParameter("name"), request.getParameter("email"), request.getParameter("pass"));
		request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		else if(request.getParameter("start")!=null) {
			int x = db.loginUser(request.getParameter("email"),request.getParameter("pass") );
			if(x==1) {
				request.getRequestDispatcher("required.jsp").forward(request, response);}
			else {
				pw.println("username and pass are not found ");
				request.getRequestDispatcher("login.jsp").include(request, response);
			}
		}
		
		
	}
	
	

}
	
		
        
	



