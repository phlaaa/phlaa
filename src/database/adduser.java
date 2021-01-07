package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.database;

public class adduser {
	final  static Connection con=database.getDBConnection();
	PreparedStatement ps = null;
	
	public void addNewStudent(String fName,String lName,String uName,String email,String pass,String contact,String city,String address){
        try {
            String sql="INSERT into users(first_name,last_name,user_name,email,password,user_type,contact_no,city,address) "
                    + "Values(?,?,?,?,?,?,?,?,?)";
            
            ps=con.prepareStatement(sql);
            ps.setString(1,fName );
            ps.setString(2,lName );
            ps.setString(3,uName );
            ps.setString(4,email );
            ps.setString(5,pass );
            ps.setString(6,"student" );
            ps.setString(7,contact );
            ps.setString(8,city );
            ps.setString(9,address );
            ps.executeUpdate();
        }
        catch (Exception ex) {
        	ex.printStackTrace();
        }
    }
	
	 public boolean loginValidate(String userName, String userPass) throws SQLException{
	        boolean status=false;
	    
	    String sql="SELECT * FROM users WHERE user_name=?";
	    ps=con.prepareStatement(sql);
	    ps.setString(1,userName);
	    ResultSet rs=ps.executeQuery();
	    String uname;
	    String pass;
	    while(rs.next())
	    {
	        uname=rs.getString("user_name");
	        pass=rs.getString("password");
	        
	            if( pass.equals(userPass)){
	                  return true;
	             } 
	    }
	    return false;
	          
	}
	 
	 public int getUserId(String userName){
	        int str=0;
	        try {
	            ps = con.prepareStatement("Select * from users where user_name=?");
	            ps.setString(1,userName);
	            ResultSet rs=ps.executeQuery();
	            while(rs.next()){
	                str= rs.getInt("user_id");
	            }
	        } catch (SQLException ex) {
	        	ex.printStackTrace();
	            
	        }
	        return str;
	    }
	
	 
	 public String getUserType(String userId){
	      
		 String str="";
	        try {
	            ps = con.prepareStatement("Select * from users where user_id=?");
	            ps.setInt(1, Integer.parseInt(userId));
	            ResultSet rs=ps.executeQuery();
	            while(rs.next()){
	                str= rs.getString("user_type");
	            }
	        } 
	        catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	        return str;
	    }
	     
}
