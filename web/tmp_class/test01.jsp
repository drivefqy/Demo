<%@ page contentType="text/html;charset=UTF-8" language="java" import="xs.*" %>
<html>
<head>
    <title>Title</title>
</head>
<>
<%
    User user1 = new User();
    user1.setName("lihua");
    user1.setAge("88");
    user1.setPwd("123456");
    user1.setPhnum("666666");

%>
user : <%=user1.getName()%><br>
age : <%=user1.getAge()%><br>
pwd : <%=user1.getPwd()%><br>
phnum : <%=user1.getPhnum()%><br>
<hr>
<jsp:useBean id="user2" class="xs.User"></jsp:useBean>
<jsp:setProperty name="user2" property="name" value="william"/>
<jsp:setProperty name="user2" property="phnum" value="666666"/>
<jsp:setProperty name="user2" property="pwd" value="123456"/>
<jsp:setProperty name="user2" property="age" value="88"/>
username:<jsp:getProperty name="user2" property="name"/><br>
pwd:<jsp:getProperty name="user2" property="pwd"/><br>
phnum:<jsp:getProperty name="user2" property="phnum"/><br>
age:<jsp:getProperty name="user2" property="age"/><br>
</body>
</html>
