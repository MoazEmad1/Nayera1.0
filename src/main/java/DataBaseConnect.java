import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Statement;



public class DataBaseConnect {
	Connection con;

	public void storeCustomer(String Firstname,String Lastname, String Email,String Phonenumber,String noofvisits,String username ,String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			PreparedStatement pstmt = con.prepareStatement("INSERT INTO Customers(FirstName,LastName,Email,Phone,NumVisits,username,password) VALUES(?,?,?,?,?,?,?)");
			pstmt.setString(1, Firstname);
			pstmt.setString(2, Lastname);
			pstmt.setString(3, Email);
			pstmt.setString(4, Phonenumber);
			pstmt.setString(5, noofvisits);
			pstmt.setString(6, username);
			pstmt.setString(7, password);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
		}
		
	}
	
	public int loginUser(String username,String password){
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			PreparedStatement pstmt =con.prepareStatement( "SELECT * FROM Customers WHERE username = '" +username+ "' AND password = '" + password+ "'");
			ResultSet result = pstmt.executeQuery();
			
			if(result.next()) {
				int id=result.getInt("CustomerID");
				
				return id;
			}
			return 0;
				
		} catch (SQLException e) {
			e.printStackTrace();
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			try {
				if(con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return 0;
	}
	
	public int search (String startdate , String enddate ){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery("SELECT * FROM Rooms r WHERE r.RoomNumber NOT IN "
					+ "(SELECT b.RoomNumber FROM Bookings b WHERE (b.CheckInDate <= '" + startdate + "' AND b.CheckOutDate > '" + enddate
					+ "') OR (b.CheckInDate < '" + startdate + "' AND b.CheckOutDate >= '" + enddate
					+ "') OR (b.CheckInDate >= '"+ startdate + "' AND b.CheckOutDate < '"+enddate+"'))");
			System.out.println(startdate+" "+enddate);
			
			if(rs.next()) {
				return 0;
			}
			else
				return 1;
				
		} catch (SQLException e) {
			e.printStackTrace();
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			try {
				if(con != null)
					con.close();
			} catch (final SQLException e) {
				e.printStackTrace();
			}
			
		}
		return 1;
		}
	
	public void addroom(String RoomType,String Price) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			PreparedStatement pstmt = con.prepareStatement("INSERT INTO rooms(RoomType,Price) VALUES(?,?)");
			pstmt.setString(1, RoomType);
			pstmt.setString(2, Price);
		 	pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
		}
	}
	
	
	}
		



	

