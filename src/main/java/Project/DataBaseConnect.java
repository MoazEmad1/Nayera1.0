package Project;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Properties;
import java.sql.Statement;
import java.time.Duration;
import java.time.LocalDate;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.catalina.connector.Response;

public class DataBaseConnect {
	Connection con;

	public void storeCustomer(String Firstname, String Lastname, String Email, String Phonenumber, String noofvisits,
			String username, String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
			PreparedStatement pstmt = con.prepareStatement(
					"INSERT INTO Customers(FirstName,LastName,Email,Phone,NumVisits,username,password) VALUES(?,?,?,?,?,?,?)");
			pstmt.setString(1, Firstname);
			pstmt.setString(2, Lastname);
			pstmt.setString(3, Email);
			pstmt.setString(4, Phonenumber);
			pstmt.setString(5, noofvisits);
			pstmt.setString(6, username);
			pstmt.setString(7, password);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
		}

	}

	public int loginUser(String username, String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
			PreparedStatement pstmt = con.prepareStatement(
					"SELECT * FROM Customers WHERE username = '" + username + "' AND password = '" + password + "'");
			ResultSet result = pstmt.executeQuery();

			if (result.next()) {
				int id = result.getInt("CustomerID");
				return id;
			}
			return 0;

		} catch (SQLException e) {
			e.printStackTrace();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return 0;
	}

	public int search(String startdate, String enddate) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery("SELECT * FROM Rooms r WHERE r.RoomNumber NOT IN "
					+ "(SELECT b.RoomNumber FROM Bookings b WHERE (b.CheckInDate <= '" + startdate
					+ "' AND b.CheckOutDate > '" + enddate + "') OR (b.CheckInDate < '" + startdate
					+ "' AND b.CheckOutDate >= '" + enddate + "') OR (b.CheckInDate >= '" + startdate
					+ "' AND b.CheckOutDate < '" + enddate + "'))");
			

			if (rs.next()) {
				return 1;
			} else
				return 0;

		} catch (SQLException e) {
			e.printStackTrace();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (final SQLException e) {
				e.printStackTrace();
			}

		}
		return 1;
	}

	public void addroom(String RoomType, String Price) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
			PreparedStatement pstmt = con.prepareStatement("INSERT INTO rooms(RoomType,Price) VALUES(?,?)");
			pstmt.setString(1, RoomType);
			pstmt.setString(2, Price);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
		}
	}

	public void addBooking(int customerId, int rno, LocalDate startdate, LocalDate enddate) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
			PreparedStatement pstmt = con.prepareStatement(
					"INSERT INTO bookings(CustomerID,RoomNumber,CheckInDate,CheckOutDate) VALUES(?,?,?,?)");
			pstmt.setString(1, "" + customerId);
			pstmt.setString(2, "" + rno);
			pstmt.setString(3, "" + startdate);
			pstmt.setString(4, "" + enddate);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (final SQLException e) {
				e.printStackTrace();
			}

		}
	}
	public void sendEmail(String email,String pass) {

		  String username="nayera2018ahmed@gmail.com";
		  String password="aUck6IbQ5r13tWXq";
		  
		  Properties prop = new Properties();
			prop.put("mail.smtp.auth" ,"true"); 
			prop.put("mail.smtp.ssl.protokls" ,"TLSv1.2");
			prop.put("mail.smtp.host","smtp-relay.sendinblue.com");
			prop.put("mail.smtp.port","587");			
			
			Session session = Session.getDefaultInstance(prop,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			
			}	
			
			});
			session.setDebug(true);
			try {
				
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("hotelonlinereservation101@gmail.com"));
				message.setRecipient(Message.RecipientType.TO,new InternetAddress(email));
				message.setSubject("Password Retriving");
				message.setText("Your password is "+pass);
				Transport.send(message); 
				
			} catch (Exception e) {
				
				System.out.println("error : "+ e.getMessage());
				
			}
	}
	public boolean retrievePassword(String email) {
		ResultSet rs = null;
		boolean result = false;

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");

			
				Statement s = con.createStatement();
				String sql = "SELECT * FROM customers WHERE Email = '" + email + "'"; //search if one of customers have that email
				rs = s.executeQuery(sql);
				
				if (rs.next()) { 
					sendEmail(email,rs.getString("password")); // it will call another method to make the email sending process
					con.close();
					result = true;//return state of its existance in database
				}
				
				con.close();

			

		} catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return result;
	}
	public int getStayDuration(String startdate, String enddate,int id,int rno) {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
	        Statement s = con.createStatement();
	        ResultSet rs = s.executeQuery("SELECT DATEDIFF('" + enddate + "', '" + startdate + "') AS Duration FROM bookings WHERE CustomerID = '"+id+"' AND RoomNumber = '"+rno+"';");
	        
	        if (rs.next()) {
	        	 int Duration =rs.getInt("Duration");
	        	 System.out.print(Duration);
	            return Duration;
	        } else {
	            return 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null)
	                con.close();
	        } catch (final SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return 0;
	}

}
