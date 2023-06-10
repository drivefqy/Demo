<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
        #style-c
			{
				font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
				font-size: 12px;
				margin: 45px;
				width: 480px;
				text-align: center;
				border-collapse: collapse;
				border-top: 7px solid #9baff1;
				border-bottom: 7px solid #9baff1;
			}
			#style-c th
			{
				font-size: 13px;
				font-weight: normal;
				padding: 8px;
				background: #e8edff;
				border-right: 1px solid #9baff1;
				border-left: 1px solid #9baff1;
				color: #039;
			}
			#style-c td
			{
				padding: 8px;
				background: #e8edff; 
				border-right: 1px solid #aabcfe;
				border-left: 1px solid #aabcfe;
				color: #669;
			}
</style>
</head>
<body>
<input type="text" value="456+66789" readonly="readonly">
<input type="checkbox"    value="456+66789">
<input type="checkbox"    value="456+66789">
<%
   try{
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu", "root", "root");
	   Statement st = con.createStatement();
	   ResultSet rs= st.executeQuery("select * from student");
%>
   <table id="style-c">
      <tr>
        <td>学号</td>
        <td>系部</td>
        <td>性别</td>
        <td>年龄</td>
        <td>姓名</td>
      </tr>
  <%   while(rs.next()){
        String sno=rs.getString("sno");
        String sdep=rs.getString("sdep");
        String ssex= rs.getString("ssex");
        String sage=rs.getString("sage");
        String sname=rs.getString("sname");
  %>
     <tr>
        <td><%=sno %></td>
        <td><%=sdep %></td>
        <td><%=ssex %></td>
        <td><%=sage %></td>
        <td><%=sname %></td>
      </tr>
   <%}
     rs.close();
     st.close();
     con.close();
   }catch(Exception e){
	   e.printStackTrace();
   }
  %>
   </table>
</body>
</html>