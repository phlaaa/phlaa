<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="pDAO" class="database.adduser" scope="page"/>

<%
if(request.getParameter("page").toString().equals("login"))
{
	if(pDAO.loginValidate(request.getParameter("username").toString(), request.getParameter("password").toString()))
	{
    	session.setAttribute("userStatus", "1");
    	session.setAttribute("userId",pDAO.getUserId(request.getParameter("username")));
    	response.sendRedirect("dashboard.jsp");
	}	
	else
	{
	    request.getSession().setAttribute("userStatus", "-1");
	  response.sendRedirect("login.jsp");
	}
}
else if(request.getParameter("page").toString().equals("register"))
{
        
        String fName =request.getParameter("fName");
        String lName =request.getParameter("lName");
        String uName=request.getParameter("uName");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contact");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
        
    
         
    pDAO.addNewStudent(fName,lName,uName,email,pass,contactNo,city,address);
    response.sendRedirect("login.jsp");
}
%>

</body>
</html>