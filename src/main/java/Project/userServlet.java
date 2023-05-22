package Project;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		if (request.getParameter("login") != null)
			request.getRequestDispatcher("login.jsp").forward(request, response);
		else if (request.getParameter("register") != null)
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		else if (request.getParameter("checkout") != null)
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		else if (request.getParameter("confirm") != null) 
			request.getRequestDispatcher("bookingConfirmed.jsp").forward(request, response);
		else if (request.getParameter("reserve") != null) 
				request.getRequestDispatcher("required.jsp").forward(request, response);
		else if(request.getParameter("cancelreserve")!=null) {
			request.getRequestDispatcher("cancellation.jsp").forward(request, response);
		}
	    else if(request.getParameter("cancel")!=null)
			request.getRequestDispatcher("confirmCancellation.jsp").forward(request, response);
		}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		DataBaseConnect db = new DataBaseConnect();
		PrintWriter pw = response.getWriter();
		if(request.getParameter("forgetpassword")!=null) {
			if(request.getParameter("email")=="")
			{
				request.getRequestDispatcher("ForgetPassword.jsp").include(request, response);
			    pw.write("<p>Please enter an Email</p>");
			}
				
			else
			{
				DataBaseConnect d = new DataBaseConnect();
				
				//call a method to check for the email existance
				boolean result= d.retrievePassword(request.getParameter("email"));
				
				if(result==true)//works if the email is in our database
				{
					//redirects the user to another basic page telling him that the password is sent to his email 
					request.getRequestDispatcher("passwordSent.jsp").forward(request, response);
								
				}
				else
				{ // works if the email doesn't exist in our database
					request.getRequestDispatcher("ForgetPassword.jsp").include(request, response);
				    pw.write("<p>This email isn't associated with any account</p>");
						
				}
			}
			return;
		}
		
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		if (email.equals("admin") && password.equals("admin")) {
			request.getRequestDispatcher("admin.jsp").forward(request, response);

		} else if (request.getParameter("signupcheck") != null) {

			db.storeCustomer(request.getParameter("Fname"), request.getParameter("Lname"),
					request.getParameter("email"), request.getParameter("phonenumber"), request.getParameter("visits"),
					request.getParameter("username"), request.getParameter("pass"));
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else if (request.getParameter("start") != null) {
			int x = db.loginUser(request.getParameter("email"), request.getParameter("pass"));
			if (x != 0) {
				request.setAttribute("id", x);
				
				request.getRequestDispatcher("cancelorbook.jsp").forward(request, response);
			} else {
				pw.println("username and pass are not found ");
				request.getRequestDispatcher("login.jsp").include(request, response);
			}
		}
	}
}
