<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  <%
    String sno=request.getParameter("sno");
  try{
	   Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useUnicode=true&characterEncoding=utf8", "root", "mysql");
       PreparedStatement st =con.prepareStatement("select * from student where sno=?");
       st.setString(1, sno);
       ResultSet rs =st.executeQuery();
       rs.next();
       String sdep= rs.getString("sdep");
       String ssex= rs.getString("ssex");
       int sage= rs.getInt("sage");
       String sname=rs.getString("sname");
       rs.close();
       st.close();
       con.close();
  %>
  <body> 
      <form action="updatestu.jsp" method="post">
      <fieldset>
      <legend>添加/修改信息</legend>
        <label>学号：<input type="text" name="sno"  value="<%=sno%>" readonly="readonly"/></label><br>
        <label>专业：<select name="sdep">
                     <option value="计算机科学系" <%if(sdep.equals("计算机科学系")){%>selected="selected"<%} %>>计算机科学系</option>
                     <option value="外语系" <%if(sdep.equals("外语系")) {%>selected="selected"<%} %>>外语系</option>
                     <option value="化工系" <%if(sdep.equals("化工系")) {%>selected="selected"<%} %>>化工系</option>
                     <option value="机械工程系" <%if(sdep.equals("机械工程系")){%>selected="selected"<%} %>>机械工程系</option>
                    </select></label><br>
        <label>性别：<input type="radio" name="ssex" value="男" <%if(ssex.equals("男")){ %>checked="checked"<%} %>>男
                    <input type="radio" name="ssex" value="女" <%if(ssex.equals("女")){ %> checked="checked"<%} %>>女</label><br>
        <label>年龄：<input type="text" name="sage"  value=<%=sage %> /></label><br>
        <label>姓名：<input type="text" name="sname" value=<%=sname %> /></label><br>
        <label><input type="submit" value="提交"></label>
      </fieldset>
      </form>
     <%}catch(Exception e){
    	 e.printStackTrace();
     }
     %>
     <br>
 
  </body>
</html>