<%@ page import="com.rex.blog.mapper.AccessMapper" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.rex.blog.service.impl.AccessServiceImpl" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.rex.blog.service.AccessService" %><%--
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
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/blogshowpage/js/jquery.min.js"></script>

</head>
<body>
<iframe id="iframe_welcome" width="100%" height="100%"
        src="${pageContext.request.contextPath}/blogpage/welcomeBlogPage" frameborder="0"
        data-id="${pageContext.request.contextPath}/blogpage/welcomeBlogPage" seamless></iframe>
<%!
    public String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
    }
%>
<%
    if (session.isNew()) {
        String ip = getIpAddr(request);
        ApplicationContext ctx =
                WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
        assert ctx != null;
        AccessService accessService = (AccessService) ctx.getBean("accessService");
        accessService.addAccess(ip);
    }
%>

<!-- 自定义 JS -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/welcomepage.js"></script>

</body>
</html>


