import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.Statement;


public class DataBaseConnect {
	Connection con;

	public void storeCustomer(String name,String email, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			PreparedStatement pstmt=con.prepareStatement("INSERT INTO customer(full_name,email,password,noofvisits) VALUES('"+name+"','"+email+"','"+password+"','0')");
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();

		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(con!=null) {
					con.close();
				}
				System.out.println("db");
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public int loginUser(String email,String password){
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			PreparedStatement pstmt =con.prepareStatement( "SELECT * FROM customer WHERE email = '" +email+ "' AND password = '" + password+ "'");
			ResultSet result = pstmt.executeQuery();


			
		
			if(result.next()) {
				return 1;
			}
			return 0;
				
		} catch (SQLException e) {
			e.printStackTrace();
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
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
	
	@SuppressWarnings("finally")
	public int search (String startdate , String enddate ){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			PreparedStatement pstmt =con.prepareStatement( "SELECT state FROM boo WHERE startdate >='" +startdate+ "' AND enddate <= '" +enddate+ "'");
			ResultSet result = pstmt.executeQuery();
		
			if(result.next()) {
				return 1;
			}
			return 0;
				
		} catch (SQLException e) {
			e.printStackTrace();
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(con != null)
					con.close();
			} catch (final SQLException e) {
				e.printStackTrace();
			}
			return 0;
		}}
	
		
	
           
			/*public void addroom (String descripton ,String type, String price,String state ) {
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
					PreparedStatement pstmt=con.prepareStatement("INSERT INTO rooms (descripton,type,price,state) VALUES('"+descripton+"','"+type+"','"+price+"','"+state+"'");
					
					pstmt.executeUpdate();
					
				}catch(SQLException e) {
					e.printStackTrace();
				}catch(ClassNotFoundException e) {
					e.printStackTrace();

				}
				catch (Exception e) {
					// TODO: handle exception
				}finally {
					try {
						if(con!=null) {
							con.close();
						}
						System.out.println("db");
					} catch (Exception e2) {
						// TODO: handle exception
					}
				}
			}     */  
      
	
	
}
