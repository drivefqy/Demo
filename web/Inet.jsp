<%@ page import="java.util.Scanner" %>
<%@ page import="java.net.Socket" %>
<%@ page import="java.net.ServerSocket" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人工客服</title>
    <style>
        /*body{*/
        /*    height: calc(96vh);*/
        /*    background-image: url("resoce/e.jpg");*/
        /*    background-size:100%  ;*/
        /*    background-repeat: no-repeat;*/
        /*    background-position: center;*/
        /*}*/
        .inet1{
            width: 60%;
            margin: 0 auto;
            height: 460px;
            border-top: 2px solid black;
            border-left: 2px solid black;
            border-right: 2px solid black;
            border-radius: 10px;
            position: relative;
            border-collapse: collapse;
        }
        textarea{
            position:absolute;
            display: block;
            width: 93%;
            height: 100px;
            border: 2px solid black;
            margin-top: 336px;
            resize: none;
            font: 25px 楷体;
            overflow: hidden;
        }
        .file1{
            position:absolute;
            display: block;
            width: 86px;
            height: 30px;
            margin-top: 330px;
            font: 15px 楷体;
        }
        .tj{
            position:absolute;
            display: block;
            width: 7%;
            height: 100px;
            margin-top: 336px;
            margin-left: 93%;
            font: 25px 楷体;
            background-color: skyblue;
        }
    </style>
</head>
<body>
<h2 style="text-align: center;margin-top: 100px ;color: black; font: 50px 楷体" >人工客服</h2>
<div class="inet1">
    <form action="" method="post" enctype="multipart/form-data" >
     <input type="file" name="file"  class="file1"><br>
    <textarea  name="text" placeholder="请输入">
        此功能未实现
    </textarea>
        <input type="submit" value="确定" class="tj">
    </form>
      <%
          request.setCharacterEncoding("utf-8");
      %>
</div>
</body>
</html>
