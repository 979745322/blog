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
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

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

</head>
<body>
<div id="fh5co-page">
    <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
    <aside id="fh5co-aside" role="complementary" class="border js-fullheight">

        <h1 id="fh5co-logo"><a href="/index">Blog</a></h1>
        <nav id="fh5co-main-menu" role="navigation">
            <ul>
                <li class="fh5co-active"><a href="/index">Home</a></li>
                <li><a href="/blogType">BlogType</a></li>
                <li><a href="/bloglist?pageNum=1">Blog</a></li>
                <li><a href="portfolio.html">Portfolio</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </nav>

        <div class="fh5co-footer">
            <p>Copyright &copy; 2019.Company name All rights reserved.</p>
            <ul>
                <li><a href="#"><i class="icon-facebook2"></i></a></li>
                <li><a href="#"><i class="icon-twitter2"></i></a></li>
                <li><a href="#"><i class="icon-instagram"></i></a></li>
                <li><a href="#"><i class="icon-linkedin2"></i></a></li>
            </ul>
        </div>

    </aside>

    <div id="fh5co-main">
        <aside id="fh5co-hero" class="js-fullheight">
            <div class="flexslider js-fullheight">
                <ul class="slides">
                    <li style="background-image: url(/blogshowpage/images/img_bg_1.jpg);">
                        <div class="overlay"></div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 text-center js-fullheight slider-text">
                                    <div class="slider-text-inner">
                                        <h1>欢迎来到我的个人博客</h1>
                                        <!--<p><a class="btn btn-primary btn-demo popup-vimeo" href=""> <i class="icon-monitor"></i> Live Preview</a> <a class="btn btn-primary btn-learn">Learn More<i class="icon-arrow-right3"></i></a></p>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li style="background-image: url(/blogshowpage/images/img_bg_2.jpg);">
                        <div class="overlay"></div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 text-center js-fullheight slider-text">
                                    <div class="slider-text-inner">
                                        <h1>Welcome to my personal blog</h1>
                                        <!--<p><a class="btn btn-primary btn-demo popup-vimeo" href="#"> <i class="icon-monitor"></i> Live Preview</a> <a class="btn btn-primary btn-learn">Learn More<i class="icon-arrow-right3"></i></a></p>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li style="background-image: url(/blogshowpage/images/img_bg_3.jpg);">
                        <div class="overlay"></div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 text-center js-fullheight slider-text">
                                    <div class="slider-text-inner">
                                        <h1>生活就是如此</h1>
                                        <h1>Life is real</h1>
                                        <!--<p><a class="btn btn-primary btn-demo popup-vimeo" href=""> <i class="icon-monitor"></i> Live Preview</a> <a class="btn btn-primary btn-learn">Learn More<i class="icon-arrow-right3"></i></a></p>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </aside>

        <div class="fh5co-narrow-content">
            <h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">Recent Blog</h2>
            <div id="div_blogTypeShow" class="row row-bottom-padded-md">
                <c:forEach begin = "0"  end="7" step="1" items="${blogTypeList}" var="blogType">
                <div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
                    <div class="blog-entry">
                        <a href="#" class="blog-img"><img src="/uploadImg/<c:out value="${blogType.blogTypeImg}"/>" id="blogTypeImg<c:out value="${blogType.id}"/>" class="img-responsive"></a>
                        <div class="desc">
                            <h3><a href="#"><c:out value="${blogType.blogTypeName}"/></a></h3>
                            <c:if test="${fn:length(blogType.blogTypeDescription)>=46 }">
                                <p class="p_blogTypeDescription"><c:out
                                        value="${fn:substring(blogType.blogTypeDescription,0,46)}"/>...</p>
                            </c:if>
                            <c:if test="${fn:length(blogType.blogTypeDescription)<46 }">
                                <p class="p_blogTypeDescription"><c:out
                                        value="${blogType.blogTypeDescription}"/></p>
                            </c:if>
                            <a href="#" class="lead">Read More <i class="icon-arrow-right3"></i></a>
                        </div>
                    </div>
                </div>
                </c:forEach>
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

</body>
</html>

