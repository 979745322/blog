<%--
  Created by IntelliJ IDEA.
  User: rex.li
  Date: 2019/4/22
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/login.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
</head>

<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-12">
            <form method="post" id="form_login">
                <h4 class="no-margins">登录：</h4>
                <p class="m-t-md">博客后台管理</p>
                <input name="userName" type="text" class="form-control uname" placeholder="用户名" />
                <input name="password" type="password" class="form-control pword m-b" placeholder="密码" />
                <a href="#">忘记密码了？</a>
                <button type="button" class="btn btn-success btn-block" onclick="userLogin()">登录</button>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/blogmanagement/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/ajaxpage.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/login.js"></script>
</body>

</html>


