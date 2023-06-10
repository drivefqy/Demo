<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>请输入你要查询的状态(空闲,正在使用,已预订,多个状态中间用空格隔开,查询全部可输入*,查询某张状态请输入ID)</h2> <br>
<table>
    <tr><th>ID</th><th>状态</th><th>可容纳人数</th><th>日期</th></tr>
<%
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String  sql = "select * from state";
    /**
     * prepareStatement(sql,a,b)
     * ResultSet.TYPE_FORWARD_ONLY只能向前滚动。
     * ResultSet.TYPE_SCROLL_INSENSITIVE和ResultSet.TYPE_SCROLL_SENSITIVE
     * 这两个方法都能够实现任意的前后滚动，使用各种移动的ResultSet指针的方法。
     * 二者的区别在于前者对于修改不敏感，而后者对于修改敏感。
     * b是设置ResultSet对象是否能够修改，取值如下：
     * ResultSet.CONCUR_READ_ONLY 设置为只读类型的参数。
     * ResultSet.CONCUR_UPDATABLE 设置为可修改类型的参数。
     */
    PreparedStatement sta = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    ResultSet resultSet = sta.executeQuery();
    /**
     * Last():指针移动到最后一条记录
     * Getrow():获取当前指针指向记录的记录号
     * Absolute()：绝对定位到某条记录
     * Relative()：相对于当前记录向前(后)移动多少条记录
     */
    resultSet.last();
    int row = resultSet.getRow();
    int pagesize = 10;
    int pagenow = 0;
    if (request.getParameter("page")==null){
      pagenow = 0;
    }
    else {
        pagenow = Integer.parseInt(request.getParameter("page"));
    }
    int sum_page = 0;
    if (row%pagesize==0){
        sum_page = row / pagesize;
    }
    else {
        sum_page = row / pagesize + 1;
    }
    // 用于判断pagenow是否合法
    if ((pagenow>sum_page-1)||(pagenow<0)){
        if (pagenow>sum_page-1){pagenow = pagenow-1;}
        else {
            pagenow = 0;
        }
    }
    resultSet.absolute(pagenow*23+1);  // 游标从1开始,顺序不对会报错
    int id = 0;
    String state = null;
    int acc = 0;
    String sta_date = null;
    for (int i = 0;i<pagesize;i++){
         id = resultSet.getInt("ID");
         state = resultSet.getString("state");
         acc = resultSet.getInt("accommodate");
         sta_date = resultSet.getString("sta_date");
%>
<tr><td><%=id%></td><td><%=state%></td><td><%=acc%></td><td><%=sta_date%></td></tr>
<%
        if (!resultSet.next()) {
            break;
        }
    }
%>
 <tr>
     <td colspan="4">
         <a href="limit.jsp?page=0">第一页</a>
         <a href="limit.jsp?page=<%=pagenow-1%>">上一页</a>
         <span style="font:20px 楷体">当前页<%=pagenow+1%></span>
         <a href="limit.jsp?page=<%=pagenow+1%>">下一页</a>
         <a href="limit.jsp?page=<%=sum_page-1%>">最后一页</a>
     </td>
 </tr>
    <% resultSet.close();
        sta.close();
        connection.close();
    %>
</table>
</body>
</html>
