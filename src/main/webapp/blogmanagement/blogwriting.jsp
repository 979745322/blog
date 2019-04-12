<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>- 写博客</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blogmanagement/css/blogmanagement.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeIn">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>写博客</h5>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="div_blog_top">
                                <div class="form-group div_blog_title">
                                    <label class="col-sm-1 control-label label_blog_title">标题:</label>
                                    <div class="col-sm-7">
                                        <input id="blogId" type="hidden">
                                        <input class="form-control input_blog_title" type="text" id="blogTitle" name="blogTitle">
                                    </div>
                                    <label class="col-sm-1 control-label label_blog_title">博客类型:</label>
                                    <div class="col-sm-2">
                                        <select class="form-control input_blog_title" id="blogType" name="blogType">
                                            <option value="life">生活娱乐</option>
                                            <option value="technology">技术笔记</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-1"></div>
                                </div>
                                <div></div>
                            </div>
                            <div id="myEditor"></div>
                            <div>
                                <label class="col-sm-3"></label>
                                <div class="col-sm-4">
                                    <button class="btn btn-success div_blog_button" onclick="publishBlog()">发表</button>
                                </div>
                                <div class="col-sm-4">
                                    <button class="btn btn-default div_blog_button" onclick="saveBlog()">保存</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="${pageContext.request.contextPath}/blogmanagement/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/ajaxpage.js"></script>

<!-- Peity -->
<script src="${pageContext.request.contextPath}/blogmanagement/js/plugins/peity/jquery.peity.min.js"></script>

<%-- ueditor --%>
<script src="${pageContext.request.contextPath}/blogmanagement/js/ueditor/ueditor.config.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/ueditor/ueditor.all.min.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"
        charset="utf-8"></script>

<!-- 自定义js -->
<script src="${pageContext.request.contextPath}/blogmanagement/js/content.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/blogmanagement.js"></script>

</body>
</html>
