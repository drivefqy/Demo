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
     request.setCharacterEncoding("utf-8");
     String sno= request.getParameter("sno");
     String sdep= request.getParameter("sdep");
     String ssex= request.getParameter("ssex");
     String sage= request.getParameter("sage");
     String sname= request.getParameter("sname");
     try{
  	   Class.forName("com.mysql.jdbc.Driver");
  	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useUnicode=true&characterEncoding=utf8", "root", "mysql");
  	   PreparedStatement st=con.prepareStatement("update student set sdep=?,ssex=?,sage=?,sname=? where sno=?");
       st.setString(1, sdep);
       st.setString(2, ssex);
       st.setInt(3, Integer.parseInt(sage));
       st.setString(4, sname);
       st.setString(5, sno);
       st.executeUpdate();
       st.close();
       con.close();
       request.getRequestDispatcher("a.jsp").forward(request, response);
     }catch(Exception e){
    	 e.printStackTrace();
     }
  
  
  
  
  %>
</body>
</html>