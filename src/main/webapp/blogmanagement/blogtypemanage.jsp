<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>- 博客类型</title>
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
                    <h5>博客类型</h5>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div id="div_searchBlogList" class="ibox float-e-margins">
                            <form class="navbar-form navbar-left form_blogSearch" role="search">
                                <div class="form-group div_blogSearch">
                                    博客类型名称：<input id="input_blogTypeName" type="text"
                                                  class="form-control input_blog_title"
                                                  placeholder="请输入博客类型名称">
                                </div>
                                <div class="form-group div_blogSearch">
                                    <button type="button" onclick="querySubmit(1)" class="btn btn-success">查询
                                    </button>
                                    <button type="button" onclick="clearForm()" class="btn btn-info">重置</button>
                                </div>
                            </form>
                            <div class="form-group div_blogAdd">
                                <button type="button" data-toggle="modal" data-target="#myModal" onclick="addBlogTypeButton" class="btn btn-success">新增
                                </button>
                            </div>
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
<div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 id="modal_title_blogType" class="modal-title"></h4>
            </div>
            <div id="div_detailType_body">
                <form class="form-horizontal form_blogType">
                    <input type="hidden" id="blogTypeId">
                    <div class="form-group"><label class="col-sm-3 control-label">博客类型名称:</label>
                        <div class="col-sm-8"><input class="form-control" type="text" id="blogTypeName"></div>

                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label">博客类型封面:</label>
                        <input class="form-control" type="hidden" id="input_blogTypeImg">
                        <div class="col-sm-5"><input class="form-control" type="file" id="blogTypeImg"></div>
                        <div class="col-sm-4"><img id="img_blogTypePreviewImg" class="img_blogTypeImg"></div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label">博客类型描述:</label>
                        <div class="col-sm-8"><textarea class="form-control" id="blogTypeDescription"></textarea></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <label class="col-sm-3"></label>
                <div class="col-sm-2">
                    <button class="btn btn-success btn_blogType" onclick="addBlogType()" >确定</button>
                </div>
                <label class="col-sm-2"></label>
                <div class="col-sm-2">
                    <button class="btn btn-default btn_blogType_close" data-dismiss="modal">关闭</button>
                </div>
                <label class="col-sm-3"></label>
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
<script src="${pageContext.request.contextPath}/blogmanagement/js/blogtypemanage.js"></script>
</body>
</html>
