<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="work_10251" class="com.javabean2" scope="request"></jsp:useBean>
<jsp:setProperty name="work_10251" property="num1" param="num1"></jsp:setProperty>
<jsp:setProperty name="work_10251" property="num2" param="num2"></jsp:setProperty>
<jsp:setProperty name="work_10251" property="oper_type" param="type"></jsp:setProperty>
<%
    System.out.println(work_10251.getNum1());
    System.out.println(work_10251.getNum2());
    out.print(work_10251.calu());
%>
</body>
</html>
