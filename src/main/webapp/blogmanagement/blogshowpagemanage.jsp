<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>- 博客页面管理</title>
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
                    <h5>博客页面管理</h5>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <table  class="table table-striped">
                                <tr class="table_tr_title">
                                    <td class="col-sm-6">标题</td>
                                    <td class="col-sm-3">图</td>
                                    <td class="col-sm-3">操作</td>
                                </tr>
                            <c:forEach items="${list}" var="blogPageImg">
                                    <tr class="table_tr_title">
                                        <td class="col-sm-6">${blogPageImg.imgTitle}</td>
                                        <td class="col-sm-3"><img width="100px" height="100px" src="/uploadImg/${blogPageImg.imgUrl}"></td>
                                        <td class="col-sm-3"><button data-toggle="modal" data-target="#myModal" onclick="updateBlogPageImg('${blogPageImg.id}','${blogPageImg.imgTitle}','${blogPageImg.imgUrl}')" class="btn btn-info">修改</button></td>
                                    </tr>
                            </c:forEach>
                            </table>
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
                <h4 id="modal_title_blogType" class="modal-title">修改博客首页滚动图信息</h4>
            </div>
            <div id="div_detailImg_body">
                <form class="form-horizontal form_blogType">
                    <input type="hidden" id="blogPageImgId">
                    <div class="form-group"><label class="col-sm-3 control-label">标题名称:</label>
                        <div class="col-sm-8"><textarea class="form-control" id="blogPageImgTitle"></textarea></div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label">图片封面:</label>
                        <input class="form-control" type="hidden" id="input_blogPageImgUrl">
                        <div class="col-sm-5"><input class="form-control" type="file" id="blogPageImgUrl"></div>
                        <div class="col-sm-4"><img id="img_blogPageImgUrl" class="img_blogTypeImg"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <label class="col-sm-3"></label>
                <div class="col-sm-2">
                    <button class="btn btn-success btn_blogType" onclick="updateBlogPageImgAjax()" >确定</button>
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
<script src="${pageContext.request.contextPath}/blogmanagement/js/blogPageImg.js"></script>

</body>
</html>
