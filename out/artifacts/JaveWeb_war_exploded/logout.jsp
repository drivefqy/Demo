<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出</title>
</head>
<body>
<%
session.removeAttribute("name_sess");
response.sendRedirect("out.jsp");
%>
</body>
</html>
