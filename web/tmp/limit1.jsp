<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: CD
  Date: 2022/11/29
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String sql ="";
    int pagesize = 20;
    int index = 0;
    try {
        index = Integer.parseInt(request.getParameter("index"));
        System.out.println(index);
    }catch (Exception e){
        index +=1;
        System.out.println("============================");
    }
    int cus = 20*index;
    sql = "select * from state limit ?,20";
    PreparedStatement sta = connection.prepareStatement(sql);
    sta.setInt(1,cus);
    ResultSet resultSet = sta.executeQuery();
    while (resultSet.next()){
        int id = resultSet.getInt("ID");
        String state = resultSet.getString("state");
        int acc = resultSet.getInt("accommodate");
        String sta_date = resultSet.getString("sta_date");
%>
<tr><td><%=id%></td><td><%=state%></td><td><%=acc%></td><td><%=sta_date%></td></tr>
<%  }
    resultSet.close();
    sta.close();
    connection.close();
%>
</table>
<a href="limit.jsp?index =<%=index+1%>">下一页</a>
</body>
</html>
