package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class result {
	final  static Connection con=database.getDBConnection();
	PreparedStatement ps = null;
	
	public void insertAnswer(int eId,int qid,String question,String ans){
        try {
            ps=con.prepareStatement("insert into answers(exam_id,question,answer,correct_answer,status) "
                    + "Values(?,?,?,?,?)");
           ps.setInt(1, eId);
            ps.setString(2, question);
            ps.setString(3, ans);
            	PreparedStatement ps1=con.prepareStatement("Select correct from questions where question_id=?");
            	ps1.setInt(1, qid);
            	ResultSet rs=ps1.executeQuery();
            	String a="";
                while(rs.next()){
                    a=rs.getString(1);
                }
            ps.setString(4,a);
	            if(ans.equals(a))
	            	 ps.setString(5, "correct");
		        else
		        	 ps.setString(5, "incorrect");
		        
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
   } 
  
	  
	  public void calculateResult(int eid,int tMarks,String endTime,int size){
	        
	        try {
	            String sql="update exams set obt_marks=?, end_time=?,status=? where exam_id=?";
	            ps=con.prepareStatement(sql);
	            	
	            	PreparedStatement ps1=con.prepareStatement("select count(answer_id) from answers where exam_id=? and status='correct'");
	            	ps1.setInt(1, eid);
		            ResultSet rs=ps1.executeQuery();
		            int m=0;
		            while(rs.next())
		            {
			           m = rs.getInt(1);
			        }
		            float rat=(float)tMarks/size;
			        rat=m*rat;
			        
	            ps.setFloat(1, rat);
	            ps.setString(2,endTime);
	            float percent=((rat*100)/tMarks);
	            if(percent>=45.0){
	                ps.setString(3,"Pass");
	            }else{
	                ps.setString(3,"Fail");
	            }
	            ps.setInt(4, eid);
	            ps.executeUpdate();
	        } 
	        catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	 
}
