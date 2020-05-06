<%@ page import="com.zt.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Liushijun
  Date: 2020/4/14
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(function () {
        $("#one").siblings().hide();
        $("#o").click(function () {
          $("#one").siblings().hide();
          $("#one").show();
        });
        $("#t").click(function () {
          $("#two").siblings().hide();
          $("#two").show();
        });
      })
    </script>
  </head>
  <body>
  <%
//    Student stu = new Student();
//    stu.setName("张三");
//    stu.setAge(20);
//    request.setAttribute("stu",stu);
  %>
  <%--<h1>姓名：${stu.name}</h1>--%>
  <p>
    <span id="o">第一个</span>
    <span id="t">第二个</span>
  </p>
  <div id="main">
    <div id="one">
      <%@include file="one.jsp"%>
    </div>
    <div id="two">
      <%@include file="two.jsp"%>
    </div>
  </div>
  <p>尾</p>
  </body>
</html>
