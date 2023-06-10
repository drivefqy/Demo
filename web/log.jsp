<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@page import =" java.io.IOException"%>
<%@page import =" java.io.FileNotFoundException"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name_user = request.getParameter("name");
    String pwd_user = request.getParameter("pwd");
    String name_sess = "name_sess";
    String str = "admin + 风清扬 ";  // 用来判断是否为管理员姓名字符串
    if ((session.getAttribute(name_sess)!=null)&&(session.getAttribute(name_sess).equals(name_user))){
        if (name_user.contains(str)){
            request.getRequestDispatcher("Interface.jsp").forward(request,response);
        }else {
            request.getRequestDispatcher("project.jsp").forward(request, response);
        }
    }
    else {
        Properties properties = new Properties();
        properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
        DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
        Connection connection = dataSource.getConnection();
        String sql = "select * from user1 where name=? and pwd=md5(?)";
        PreparedStatement sta = connection.prepareStatement(sql);
        sta.setString(1, name_user);
        sta.setString(2, pwd_user);
        ResultSet result = sta.executeQuery();
        if (result.next()) {
            session.setAttribute(name_sess, name_user);
            int tmp = 0;
            String id = result.getString(1);
            System.out.println(id);
           if (id.contains("admin")){
               System.out.println(id+"======================");
               request.getRequestDispatcher("Interface.jsp").forward(request,response);
               connection.close();
               sta.close();
           }
            else {
               System.out.println(id);
                request.getRequestDispatcher("project.jsp").forward(request,response);
                connection.close();
                sta.close();
            }
        }else {
%>
<h2 style="text-align: center;margin-top: 200px ;color: red" >登录失败！！！请检查用户名或密码是否输入正确</h2>
<h2 style="text-align: center;margin-top: 20px"><a href ='longin.jsp' style="text-decoration: none;" >点击此处返回登录界面</a></h2>
<%
    if (connection!=null||sta!=null){
        try {
            // 懒处理
            connection.close();
            sta.close();
        }catch (Exception e){
            System.out.println("捕获到一个异常");
        }
        }
        }
    }
%>

</body>
</html>
