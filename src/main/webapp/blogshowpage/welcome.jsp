<%--
  Created by IntelliJ IDEA.
  User: rex.li
  Date: 2019/4/16
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js">
<head>
    <!-- welcome.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogshowpage/css/welcomepage.css">

</head>
<body>
<iframe id="iframe_welcome" width="100%" height="100%"
        src="${pageContext.request.contextPath}/blogpage/welcomeBlogPage" frameborder="0"
        data-id="${pageContext.request.contextPath}/blogpage/welcomeBlogPage" seamless></iframe>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/jquery.min.js"></script>

<!-- 自定义 JS -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/welcomepage.js"></script>

</body>
</html>


