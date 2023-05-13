

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/showrooms")
public class showrooms extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public showrooms() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		DataBaseConnect db = new DataBaseConnect();
		PrintWriter pw = response.getWriter();
		String start = request.getParameter("startdate");
		String end =request.getParameter("enddate");
		LocalDate startdate1 = LocalDate.parse(start);
		LocalDate enddate1 = LocalDate.parse(end);
		int count = Integer.parseInt(request.getParameter("count"));
		request.setAttribute("c",count);
		
		if (request.getParameter("search") != null) {

			if (enddate1.isBefore(startdate1)) {
				request.setAttribute("errorMessage", "End date must be after start date.");
				request.getRequestDispatcher("required.jsp").include(request, response);

			} else {
				int f = db.search(request.getParameter("startdate"), request.getParameter("enddate"));
				if (f == 1) {
					request.getRequestDispatcher("required.jsp").include(request, response);
					pw.println("THERE IS NO AVAILABELE ROOMS AT THIS DATE ");
					pw.println("YOU CAN CHOOSE ANOHER DATE");
				}
			}
		} else {

			request.getRequestDispatcher("show.jsp").forward(request, response);
		}
	}

}


