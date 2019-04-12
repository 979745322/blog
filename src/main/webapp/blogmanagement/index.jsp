<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>BlogManage</title>

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->

    <link href="${pageContext.request.contextPath}/blogmanagement/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/buttonstyle.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                                <span class="block m-t-xs" style="font-size:20px;">
                                    <strong class="font-bold">BlogManage</strong>
                                </span>
                            </span>
                        </a>
                    </div>
                    <div class="logo-element">Blog</div>
                </li>
                <li class="line"></li>
                <li>
                    <a class="J_menuItem" href="${pageContext.request.contextPath}/blogmanage/mainpage">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <li>
                    <a class="J_menuItem" href="${pageContext.request.contextPath}/blogmanage/blog">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">博客管理</span>
                    </a>
                </li>

                <li class="line"></li>

            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i
                        class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <%--<i><s:property value="#session.user.getUsername()"/></i>--%>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="">
                                    <a class="J_menuItem" href="info.jsp">
                                        查看个人信息
                                    </a>
                                </div>
                            </li>

                            <li>
                                <div class="">
                                    <a class="J_menuItem" href="updateinfo.jsp">
                                        修改个人信息
                                    </a>
                                </div>
                            </li>

                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="login.html">
                                        <strong> 退出登录</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>

                </ul>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%"
                    src="${pageContext.request.contextPath}/blogmanage/mainpage" frameborder="0"
                    data-id="${pageContext.request.contextPath}/blogmanage/mainpage" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script src="${pageContext.request.contextPath}/blogmanagement/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/plugins/layer/layer.min.js"></script>


<!-- 自定义js -->
<script src="${pageContext.request.contextPath}/blogmanagement/js/hAdmin.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/index.js" type="text/javascript"></script>

</body>

</html>
