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
                    <a class="J_menuItem" href="${pageContext.request.contextPath}/blogmanage/mainPage">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <li>
                    <a class="J_menuItem">
                        <i class="fa fa-server"></i>
                        <span class="nav-label">博客管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/blogmanage/blogList">博客列表</a>
                        </li>
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/blogmanage/blogTypeManage">博客类别</a>
                        </li>
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/blogmanage/blogWriting">写博客</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="J_menuItem" href="${pageContext.request.contextPath}/blogmanage/blogShowPageManage">
                        <i class="fa fa-tv"></i>
                        <span class="nav-label">博客页面管理</span>
                    </a>
                </li>
                <li>
                    <a class="J_menuItem" href="${pageContext.request.contextPath}/blogmanage/blogMessage">
                        <i class="fa fa-comments"></i>
                        <span class="nav-label">留言管理</span>
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
                    <li class="text-center link-block"><button class="btn btn-default"><a href="javascript:;" onclick="redirect($(this))" val="/blogmanage/logout">退出登录</a></button></li>
                </ul>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%"
                    src="${pageContext.request.contextPath}/blogmanage/mainPage" frameborder="0"
                    data-id="${pageContext.request.contextPath}/blogmanage/mainPage" seamless></iframe>
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
