<%--
  Created by IntelliJ IDEA.
  User: CD
  Date: 2022/10/20
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录验证</title>
</head>
<body>

<jsp:useBean id="userlist" class="xs.User"></jsp:useBean>
<jsp:setProperty name="userlist" property="name" param="name"/>
<jsp:setProperty name="userlist" property="pwd" param="pwd"/>
<%
if (userlist.check()){
    out.print("ok");
}
else {
    out.print("defeat");
}
%>

</body>
</html>
