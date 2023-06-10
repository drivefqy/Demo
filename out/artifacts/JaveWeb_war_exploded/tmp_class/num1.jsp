<%@ page import="com.javabean1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="work_1025" class="com.javabean1" scope="request"/>
<jsp:setProperty name="work_1025" property="radius" param="ra"/>
<%
     out.print(work_1025.area()+"<br>");
     out.print(work_1025.circ());
%>
</body>
</html>
