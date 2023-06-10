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
<%
int pageSize = 3;  //一页显示几条记录
int rowCount;//记录总数       
int pageCount = 0;//总页数       
int pageNow;//当前页 
String strPagaNow =request.getParameter("pageNow");
if(strPagaNow==null){
  pageNow =1;
}else{
 pageNow = Integer.parseInt(strPagaNow); 
}
   try{
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useUnicode=true&characterEncoding=utf8", "root", "mysql");
	   Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	   ResultSet rs= st.executeQuery("select * from student");
	   rs.last();
	   rowCount=rs.getRow();
	   if(rowCount%pageSize==0){
		   pageCount =rowCount/pageSize;
	   }else{
		   pageCount =rowCount/pageSize+1;
	   }
	   rs.absolute((pageNow-1)*3);
	   
%>
   <table id="style-c">
      <tr>
        <td>学号</td>
        <td>系部</td>
        <td>性别</td>
        <td>年龄</td>
        <td>姓名</td>
        <td>操作</td>
      </tr>
  <%   for(int i=0;i<pageSize;i++){
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
        <td><a href="insert.jsp">增加</a>&nbsp;&nbsp;<a href="delete.jsp?sno=<%=sno%>">删除</a>&nbsp;&nbsp;<a href="update.jsp?sno=<%=sno%>">修改</a></td>
      </tr>
   <%
   if(!rs.next()){
   	break;
      }
     }
     rs.close();
     st.close();
     con.close();
   }catch(Exception e){
	   e.printStackTrace();
   }
  %>
  <tr >
    <td colspan="6">
      <%
        for(int i=1;i<=pageCount;i++){
      %>
            <a href="a.jsp?pageNow=<%=i%>">第<%=i %>页</a>
      <%} %>
    </td>
  </tr>
   </table>
</body>
</html>