$(document).ready(function () {
    querySubmit(1);
    var blogTypeList = ajaxdata("/blogmanage/selectBlogTypeAll", "").blogTypeList;
    $.each(blogTypeList, function (n, value) {
        $("#select_blogType").append("<option value=" + value.id + ">" + value.blogTypeName + "</option>")
    });
});

// 清空所有查询框
function clearForm() {
    $('#div_searchBlogList form')[0].reset();
    querySubmit(1);
}

/**
 * 查询分页
 * @param pageNum 页数
 */
function querySubmit(pageNum) {
    var pageData = {
        pageNum: pageNum,
        blogTitle: $('#input_blogTitle').val(),
        blogType: $('#select_blogType').val(),
        blogState: $('#select_blogState').val(),
        startTime: $('#input_StartTime').val(),
        endTime: $('#input_EndTime').val()
    };
    var blogTypeList = ajaxdata("/blogmanage/selectBlogTypeAll", "").blogTypeList;
    var pageInfo = ajaxdata("/blogmanage/page", pageData).pageInfo;
    $("#div_blogTable").html(blogTable(pageInfo, blogTypeList));
    pageInfoBar(pageInfo, "div_pageBar");
}

/**
 * 拼接查询博客列表
 * @param pageInfo 分页信息
 */
function blogTable(pageInfo, blogTypeList) {
    var list = pageInfo.list;
    var table = [];
    table.push("<table class=\"table table-striped\">");
    var tableFirstTr = "<tr class=\"table_tr_title\">\n" +
        "                    <td>序号</td>\n" +
        "                    <td>标题</td>\n" +
        "                    <td>类型</td>\n" +
        "                    <td>状态</td>\n" +
        "                    <td>创建时间</td>\n" +
        "                    <td>操作</td>\n" +
        "                </tr>";
    table.push(tableFirstTr);
    for (var i = 0; i < list.length; i++) {
        var num = (pageInfo.pageNum - 1) * pageInfo.pageSize + i + 1;
        var tableTr = [];
        tableTr.push("<tr>");
        // 序号
        tableTr.push("<td>" + num + "</td>");
        // 标题
        var blogTitle = list[i].blogTitle.length > 20 ? list[i].blogTitle.substring(0, 21) + "..." : list[i].blogTitle;
        tableTr.push("<td>" + blogTitle + "</td>");
        // 类型
        $.each(blogTypeList, function (n, value) {
            if (value.id == list[i].blogType) {
                tableTr.push("<td>" + value.blogTypeName + "</td>");
                return false;
            }
        });
        // 状态
        switch (list[i].blogState) {
            case "1" :
                tableTr.push("<td>草稿</td>");
                break;
            case "2" :
                tableTr.push("<td>公开</td>");
                break;
            case "3" :
                tableTr.push("<td>私密</td>");
                break;
        }
        // 创建时间
        tableTr.push("<td>" + list[i].createTime + "</td>");
        // 操作
        tableTr.push("<td>" +
            "<button data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"detailBlog(" + list[i].id + ")\" class=\"btn btn-default\">查看</button>&nbsp;&nbsp;" +
            "<button onclick=\"updateBlog(" + list[i].id + ")\" class=\"btn btn-info\">编辑</button>&nbsp;&nbsp;" +
            "<button onclick=\"deleteBlog(" + list[i].id + "," + pageInfo.pageNum + ")\" class=\"btn btn-danger\">删除</button></td>");

        tableTr.push("</tr>");
        table.push(tableTr.join(""));
    }
    table.push("</table>");
    return table.join("");
}

/**
 * 查看博客
 * @param id 博客id
 * @param pageNum 当前页
 */
function detailBlog(id) {
    $("#div_modal_body").html(ajaxdata("/blogmanage/selectBlog", id).blog.blogContent);
}

/**
 * 编辑博客
 * @param id 博客id
 * @param pageNum 当前页
 */
function updateBlog(id) {
    window.location = "/blogmanage/updateBlog?id=" + id;
}

/**
 * 删除博客
 * @param id 博客id
 * @param pageNum 当前页
 */
function deleteBlog(id, pageNum) {
    if (confirm("确认删除该博客？")) {
        alert(ajaxdata("/blogmanage/deleteBlog", id).state);
        querySubmit(pageNum);
    }
}





