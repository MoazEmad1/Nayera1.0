

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
	   if(request.getParameter("add")!=null) {
		request.getRequestDispatcher("addroom.jsp").forward(request, response);}
		if(request.getParameter("addroom")!=null) {
			 String number =request.getParameter("number");
			String description = request.getParameter("description");
		        String type = request.getParameter("type");
		        double price = Double.parseDouble(request.getParameter("price"));
                 String state = request.getParameter("state");
		        
                  room room = new room(number, description, type, price, state);

		        try {
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

		            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO room (number,description, type, price, state) VALUES (?, ?, ?, ?)");
		            pstmt.setString(1, room.getDescription());
		            pstmt.setString(2, room.getType());
		            pstmt.setDouble(3, room.getPrice());
		            pstmt.setString(3, room.getNumber());

		            int rowsInserted = pstmt.executeUpdate();

		            // Check if the room was added successfully
		            if (rowsInserted > 0) {
		                request.setAttribute("message", "Room added successfully");
		            } else {
		                request.setAttribute("message", "Failed to add room");
		            }

		            connection.close();
		        } catch (ClassNotFoundException | SQLException e) {
		            e.printStackTrace();
		            request.setAttribute("message", "Failed to add room");
		        }

		        // Forward the request to a JSP page to display the result message
		        RequestDispatcher dispatcher = request.getRequestDispatcher("addroom.jsp");
		        dispatcher.forward(request, response);
		    }
			
		if(request.getParameter("report")!=null)
		     request.getRequestDispatcher("showreport.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
