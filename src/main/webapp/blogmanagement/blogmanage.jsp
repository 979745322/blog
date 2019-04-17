<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>- 博客列表</title>
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
                    <h5>博客列表</h5>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div id="div_searchBlogList" class="ibox float-e-margins">
                            <form class="navbar-form navbar-left form_blogSearch" role="search">
                                <div class="div_blogSearch_top">
                                    <div class="form-group div_blogSearch">
                                        博客标题：<input id="input_blogTitle" type="text"
                                                    class="form-control input_blog_title"
                                                    placeholder="请输入博客标题">
                                    </div>
                                    <div class="form-group div_blogSearch">
                                        创建时间(起)：<input id="input_StartTime" type="datetime-local"
                                                       class="form-control input_dateTime input_blog_title">
                                    </div>
                                    <div class="form-group div_blogSearch">
                                        创建时间(止)：<input id="input_EndTime" type="datetime-local"
                                                       class="form-control input_dateTime input_blog_title">
                                    </div>
                                </div>
                                <div class="div_blogSearch_top">
                                    <div class="form-group div_blogSearch">
                                        博客类型：<select class="form-control input_blog_title" id="select_blogType"
                                                     name="blogType">
                                        <option value="0">全部</option>
                                    </select>
                                    </div>
                                    <div class="form-group div_blogSearch">
                                        博客状态：<select class="form-control input_blog_title" id="select_blogState"
                                                     name="blogState">
                                        <option value="0">全部</option>
                                        <option value="1">草稿</option>
                                        <option value="2">公开</option>
                                        <option value="3">私密</option>
                                    </select>
                                    </div>

                                    <div class="form-group div_blogSearch">
                                        <button type="button" onclick="querySubmit(1)" class="btn btn-success">查询
                                        </button>
                                        <button type="button" onclick="clearForm()" class="btn btn-info">重置</button>
                                    </div>
                                </div>
                            </form>
                            <p style="clear:both"></p>
                            <div id="div_blogTable">
                            </div>
                            <nav id="div_pageBar" class="navbar-right" aria-label="Page navigation">
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade div_modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog div_modal_dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">查看博客</h4>
            </div>
            <div id="div_modal_body" class="modal-body">

            </div>
            <div class="modal-footer">
                <label class="col-sm-10"></label>
                <div class="col-sm-2">
                    <button class="btn btn-default" data-dismiss="modal">关闭</button>
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

<!-- 自定义js -->
<script src="${pageContext.request.contextPath}/blogmanagement/js/content.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/pageInfoBar.js"></script>
<script src="${pageContext.request.contextPath}/blogmanagement/js/blogmanager.js"></script>
</body>
</html>
