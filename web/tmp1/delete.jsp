<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  String sno=request.getParameter("sno");
try{
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "root", "mysql");
	   PreparedStatement st = con.prepareStatement("delete from student where sno=?");
	   st.setString(1, sno);
       st.executeUpdate();
       request.getRequestDispatcher("a.jsp").forward(request, response);
   }catch(Exception e){
	e.printStackTrace();
   }

%>
</body>
</html>