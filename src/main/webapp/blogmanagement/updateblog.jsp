<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>- 编辑博客</title>
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
                    <h5>编辑博客</h5>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="div_blog_top">
                                <div class="form-group div_blog_title">
                                    <label class="col-sm-1 control-label label_blog_title">标题:</label>
                                    <div class="col-sm-5">
                                        <input id="blogId" type="hidden" value="${blog.id}">
                                        <input class="form-control input_blog_title" type="text" id="blogTitle"
                                               name="blogTitle" value="${blog.blogTitle}">
                                    </div>
                                    <label class="col-sm-1 control-label label_blog_title">博客类型:</label>
                                    <div class="col-sm-2">
                                        <select class="form-control input_blog_title" id="blogType" name="blogType" value="${blog.blogType}">
                                        </select>
                                    </div>
                                    <label class="col-sm-1 control-label label_blog_title">博客状态:</label>
                                    <div class="col-sm-2">
                                        <select class="form-control input_blog_title" id="blogState" name="blogState" value="${blog.blogState}">
                                            <option value="1">草稿</option>
                                            <option value="2">公开</option>
                                            <option value="3">私密</option>
                                        </select>
                                    </div>
                                </div>
                                <div></div>
                            </div>
                            <div id="myEditor"></div>
                            <div>
                                <label class="col-sm-11"></label>
                                <div class="col-sm-1">
                                    <button class="btn btn-success div_blog_button" onclick="publishBlog()">发表</button>
                                </div>
                            </div>
                            <div id="div_blog_content" class="none">
                                ${blog.blogContent}
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
<script src="${pageContext.request.contextPath}/blogmanagement/js/blogwriting.js"></script>
</body>
</html>
