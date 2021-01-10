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
            ps.setInt(1,eId);
System.out.println(question);
            ps.setString(2, question);
            ps.setString(3,ans);
            String correct=getCorrectAnswer(qid);
            ps.setString(4, correct);
            ps.setString(5,getAnswerStatus(ans,correct));
            ps.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
   } 

	private String getCorrectAnswer(int qid) {
        String ans="";
        try {
            ps=con.prepareStatement("Select correct from questions where question_id=?");
            ps.setInt(1,qid);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                ans=rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }      
        return ans;
    }
	
	  private String getAnswerStatus(String ans, String correct) {
	        String resp="";
	        if(ans.equals(correct)){
	            resp="correct";
	        }else{
	            resp="incorrect";
	        }
	        return resp;     
	    }
	  
	  public void calculateResult(int eid,int tMarks,String endTime,int size){
	        
	        try {
	            String sql="update exams set obt_marks=?, end_time=?,status=? where exam_id=?";
	            ps=con.prepareStatement(sql);
	            int obt=getObtMarks(eid,tMarks,size);
	            ps.setInt(1,obt);
	            ps.setString(2,endTime);
	            float percent=((obt*100)/tMarks);
	            if(percent>=45.0){
	                ps.setString(3,"Pass");
	            }else{
	                ps.setString(3,"Fail");
	            }
	            ps.setInt(4, eid);
	            ps.executeUpdate();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	  
	  private int getObtMarks(int examId,int tMarks,int size) {
		    int m=0;
		    
		        try {
		            ps=con.prepareStatement("select count(answer_id) from answers where exam_id=? and status='correct'");
		            ps.setInt(1, examId);
		            ResultSet rs=ps.executeQuery();
		            while(rs.next()){
		               m = rs.getInt(1);
		            }
		        } catch (SQLException ex) {
		           ex.printStackTrace();
		        }
		        float rat=(float)tMarks/size;
		        System.out.println(rat);
		        rat=m*rat;
		        System.out.println(rat);
		    return m=(int) rat;
		    } 

}
