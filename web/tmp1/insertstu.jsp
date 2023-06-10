<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");
  String sno=request.getParameter("sno");
  String sdep= request.getParameter("sdep");
  String ssex= request.getParameter("ssex");
  String sage= request.getParameter("sage");
  String sname= request.getParameter("sname");
  try{
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "root", "mysql");
       PreparedStatement st=con.prepareStatement("insert into student(sno,sdep,ssex,sage,sname) values(?,?,?,?,?)");
       st.setString(1, sno);
       st.setString(2, sdep);
       st.setString(3, ssex);
       st.setInt(4, Integer.parseInt(sage));
       st.setString(5, sname);
      int i = st.executeUpdate();
      System.out.println(i);
      request.getRequestDispatcher("a.jsp").forward(request, response);
  }catch(Exception e){
      System.out.println("=========================");
	  e.printStackTrace();
  }

%>
</body>
</html>