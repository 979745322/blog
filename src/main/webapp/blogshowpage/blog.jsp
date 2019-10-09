<%--
  Created by IntelliJ IDEA.
  User: rex.li
  Date: 2019/4/16
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">


    <!-- Animate.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogshowpage/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogshowpage/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogshowpage/css/bootstrap.css">
    <!-- Flexslider  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogshowpage/css/flexslider.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogshowpage/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogshowpage/css/blogshowpage.css">

    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/blogshowpage/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/blogshowpage/js/respond.min.js"></script>
    <![endif]-->

    <!-- 国际化文档 JS -->
    <script src="${pageContext.request.contextPath}/blogshowpage/js/zh-CN.js"></script>
</head>
<body>
<div id="fh5co-page">
    <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
    <aside id="fh5co-aside" role="complementary" class="border js-fullheight">

        <h1 id="fh5co-logo"><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/welcomeBlogPage"><script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG);</script></a></h1>
        <nav id="fh5co-main-menu" role="navigation">
            <ul>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/welcomeBlogPage"><script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_HOME);</script></a></li>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/blogType"><script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_BLOG_TYPE);</script></a></li>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/bloglist?pageNum=1"><script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_RECENT_BLOGS);</script></a></li>
                <%--<li><a href="javascript:;" onclick="redirect($(this))" val="/blogpageportfolio.html">Portfolio</a></li>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpageabout.html">About</a></li>--%>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/contact?pageNum=1"><script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_CONTACT);</script></a></li>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/chatRobot"><script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_CHATROBOT);</script></a></li>
            </ul>
        </nav>

        <div class="fh5co-footer">
            <p><script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_PAGE_FOOT);</script></p>
            <ul>
                <li><a data-toggle="popoverhov" data-placement="top" data-content="15235284050" href="javascript:;" onclick="redirect($(this))" val="#"><img src="/blogshowpage/images/phone-fill.png"/></a></li>
                <li><a data-toggle="popoverhov" data-placement="top" data-content="979745322@qq.com" href="javascript:;" onclick="redirect($(this))" val="#"><img src="/blogshowpage/images/email-fill.png"/></a></li>
                <li><a data-toggle="popoverhov" data-placement="top" data-content="15235284050" href="javascript:;" onclick="redirect($(this))" val="#"><img src="/blogshowpage/images/wechat-fill.png"/></a></li>
                <li><a data-toggle="" data-placement="top" data-content="979745322" onclick="redirect($(this))" val="tencent://message/?uin=979745322&Site=qq&Menu=yes"><img src="/blogshowpage/images/qq-fill.png"/></a></li>
            </ul>
        </div>

    </aside>

    <div id="fh5co-main">
        <div class="fh5co-narrow-content">
            <h2><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/blogTypeDetail?blogTypeId=${blog.blogType}&&pageNum=1" class="fh5co-heading animate-box"
                   data-animate-effect="fadeInLeft"><i class="icon-arrow-left3"></i><script>document.write(I18N_BLOG_SHOW_PAGE_DETAIL.BACK_BLOG_DETIAL_TYPE);</script></a></h2>
            <div class="row row-bottom-padded-md dcss">
                ${blog.blogContent}
            </div>
        </div>

    </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/jquery.flexslider-min.js"></script>
<!-- Masonry -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/masonry.pkgd.min.js"></script>
<!-- jqthumb -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/jqthumb.min.js"></script>
<!-- imagesloaded -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/imagesloaded.pkgd.min.js"></script>

<!-- MAIN JS -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/main.js"></script>

<!-- 自定义 JS -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/blogpage.js"></script>
<script src="${pageContext.request.contextPath}/blogshowpage/js/blogpagepopover.js"></script>

</body>
</html>


