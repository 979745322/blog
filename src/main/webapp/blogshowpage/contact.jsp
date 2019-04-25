<%--
  Created by IntelliJ IDEA.
  User: rex.li
  Date: 2019/4/23
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <a href="javascript:;" onclick="redirect($(this))" val="/blogpage#"
       class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
    <aside id="fh5co-aside" role="complementary" class="border js-fullheight">

        <h1 id="fh5co-logo"><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/welcomeBlogPage">
            <script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG);</script>
        </a></h1>
        <nav id="fh5co-main-menu" role="navigation">
            <ul>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/welcomeBlogPage">
                    <script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_HOME);</script>
                </a></li>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/blogType">
                    <script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_BLOG_TYPE);</script>
                </a></li>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpage/bloglist?pageNum=1">
                    <script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_RECENT_BLOGS);</script>
                </a></li>
                <%--<li><a href="javascript:;" onclick="redirect($(this))" val="/blogpageportfolio.html">Portfolio</a></li>
                <li><a href="javascript:;" onclick="redirect($(this))" val="/blogpageabout.html">About</a></li>--%>
                <li class="fh5co-active"><a href="javascript:;" onclick="redirect($(this))"
                                            val="/blogpage/contact?pageNum=1">
                    <script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_CONTACT);</script>
                </a></li>
            </ul>
        </nav>

        <div class="fh5co-footer">
            <p>
                <script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_PAGE_FOOT);</script>
            </p>
            <ul>
                <li><a data-toggle="popoverhov" data-placement="top" data-content="15235284050" href="javascript:;" onclick="redirect($(this))" val="#"><img src="/blogshowpage/images/phone-fill.png"/></a></li>
                <li><a data-toggle="popoverhov" data-placement="top" data-content="979745322@qq.com" href="javascript:;" onclick="redirect($(this))" val="#"><img src="/blogshowpage/images/email-fill.png"/></a></li>
                <li><a data-toggle="popoverhov" data-placement="top" data-content="15235284050" href="javascript:;" onclick="redirect($(this))" val="#"><img src="/blogshowpage/images/wechat-fill.png"/></a></li>
                <li><a data-toggle="popoverhov" data-placement="top" data-content="979745322" href="tencent://message/?uin=979745322&Site=qq&Menu=yes"><img src="/blogshowpage/images/qq-fill.png"/></a></li>
            </ul>
        </div>

    </aside>

    <div id="fh5co-main">
        <div class="fh5co-narrow-content animate-box" data-animate-effect="fadeInLeft">
            <div class="row">
                <div class="col-md-4">
                    <h2><script>document.write(I18N_BLOG_SHOW_PAGE_MENUE.BLOG_CONTACT);</script></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <textarea name="" id="messageContent" cols="30" rows="7" class="form-control"
                                          placeholder="有什么想对我说的，把它写下来(必填)"></textarea>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <input type="text" id="messageName" class="form-control" placeholder="留言昵称(必填)">
                            </div>
                            <div class="form-group">
                                <input type="email" id="messageEmail" class="form-control"
                                       placeholder="邮箱,仅用于提醒回复,不会公开(非必填)">
                            </div>
                            <div class="form-group">
                                <input type="button" onclick="addBlogMessage()" class="btn btn-primary btn-md"
                                       value="发表留言">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <table class="table_contact">
                        <c:forEach items="${messageList}" var="list">
                            <div>
                                <%--分割线--%>
                                <tr>
                                    <td colspan="2" class="td_hr_contact col-md-12">
                                        <hr class="hr_blog">
                                    </td>
                                </tr>
                                <c:forEach items="${list}" begin="0" end="0" var="blogMessage">
                                    <%--留言--%>
                                    <tr class="tr_contact_first">
                                        <td class="col-md-1">${blogMessage.name}：</td>
                                        <td class="col-md-11">${blogMessage.content}</td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-1"></td>
                                        <td class="col-md-11"><span>${blogMessage.createTime}</span><span
                                                class="span_contact">
                                    <a href="#" data-toggle="popover" replyName="${blogMessage.name}"
                                       replyId="${blogMessage.id}">回复</a>
                                </span></td>
                                    </tr>
                                    <%--留言end--%>
                                </c:forEach>
                                <c:forEach items="${list}" begin="1" var="blogMessage">
                                    <%--回复--%>
                                    <tr>
                                        <td class="col-md-1"></td>
                                        <td class="td_hr_contact col-md-11">
                                            <span class="col-md-11"><hr class="hr_blog"></span><span
                                                class="col-md-1"></span>
                                        </td>
                                    </tr>
                                    <tr class="tr_contact_other">
                                        <td class="col-md-1"></td>
                                        <td class="col-md-10"><span class="col-md-1">${blogMessage.name}：</span><span
                                                class="col-md-11 td_hr_contact">${blogMessage.content}</span></td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-1"></td>
                                        <td class="col-md-11"><span
                                                class="col-md-1"></span><span>${blogMessage.createTime}</span><span
                                                class="span_contact"><a href="#" data-toggle="popover"
                                                                        replyName="${blogMessage.name}"
                                                                        replyId="${list[0].id}">回复</a>
                                </span></td>
                                    </tr>

                                    <%--回复end--%>
                                </c:forEach>
                            </div>
                        </c:forEach>
                        <%--分割线--%>
                        <tr>
                            <td colspan="2" class="td_hr_contact col-md-12">
                                <hr class="hr_blog">
                            </td>
                        </tr>

                    </table>
                    <div class="div_pageBar">
                        <ul class="pagination">
                            <c:if test="${pageInfo.pageNum>1}">
                                <li class="prev-next"><a
                                        href="/blogpage/contact?pageNum=${pageInfo.pageNum-1}"
                                        aria-label="Previous"><span
                                        aria-hidden="true">«</span></a></li>
                            </c:if>
                            <c:forEach items="${pageInfo.navigatepageNums}" var="navigatepageNums">
                                <c:if test="${pageInfo.pageNum == navigatepageNums}">
                                    <li class="active"><a
                                            href="/blogpage/contact?pageNum=${navigatepageNums}">${navigatepageNums}</a>
                                    </li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum != navigatepageNums}">
                                    <li>
                                        <a href="javascript:;" onclick="redirect($(this))"
                                           val="/blogpage/contact?pageNum=${navigatepageNums}">${navigatepageNums}</a>
                                    </li>
                                </c:if>

                            </c:forEach>
                            <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                <li class="bus-border-right prev-next"><a
                                        href="/blogpage/contact?pageNum=${pageInfo.pageNum+1}"
                                        aria-label="Next"><span
                                        aria-hidden="true">»</span></a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%--<div id="map"></div>--%>
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
<script src="${pageContext.request.contextPath}/blogmanagement/js/ajaxpage.js"></script>
<script src="${pageContext.request.contextPath}/blogshowpage/js/blogpage.js"></script>
<script src="${pageContext.request.contextPath}/blogshowpage/js/blogmessage.js"></script>
<script src="${pageContext.request.contextPath}/blogshowpage/js/blogpagepopover.js"></script>

<!-- 国际化文档 JS -->
<script src="${pageContext.request.contextPath}/blogshowpage/js/zh-CN.js"></script>


</body>
</html>


