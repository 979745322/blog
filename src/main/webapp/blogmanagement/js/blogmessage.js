$(document).ready(function () {
    querySubmit(1);
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
        name: $('#input_messageName').val(),
        content: $('#input_messageContent').val(),
        startTime: $('#input_StartTime').val(),
        endTime: $('#input_EndTime').val(),
        replyId: $('#input_replyId').val()
    };
    var pageInfo = ajaxdata("/blogmanage/blogMessagePage", pageData).pageInfo;
    $("#div_blogTable").html(blogTable(pageInfo));
    pageInfoBar(pageInfo, "div_pageBar");
}

/**
 * 拼接查询博客列表
 * @param pageInfo 分页信息
 */
function blogTable(pageInfo) {
    var list = pageInfo.list;
    var table = [];
    table.push("<table class=\"table table-striped\">");
    var tableFirstTr = "<tr class=\"table_tr_title\">\n" +
        "                    <td>序号</td>\n" +
        "                    <td>ID</td>\n" +
        "                    <td>留言昵称</td>\n" +
        "                    <td>留言内容</td>\n" +
        "                    <td>留言邮箱</td>\n" +
        "                    <td>创建时间</td>\n" +
        "                    <td>回复ID</td>\n" +
        "                    <td>操作</td>\n" +
        "                </tr>";
    table.push(tableFirstTr);
    for (var i = 0; i < list.length; i++) {
        var num = (pageInfo.pageNum - 1) * pageInfo.pageSize + i + 1;
        var tableTr = [];
        tableTr.push("<tr>");
        // 序号
        tableTr.push("<td>" + num + "</td>");
        // ID
        tableTr.push("<td>" + list[i].id + "</td>");
        // 留言昵称
        tableTr.push("<td>" + list[i].name + "</td>");
        // 留言内容
        tableTr.push("<td>" + list[i].content + "</td>");
        // 留言邮箱
        tableTr.push("<td>" + list[i].email + "</td>");
        // 创建时间
        tableTr.push("<td>" + list[i].createTime + "</td>");
        // 回复ID
        tableTr.push("<td>" + list[i].replyId + "</td>");
        // 操作
        tableTr.push("<td>" +
            "<button onclick=\"deleteMessage(" + list[i].id + "," + pageInfo.pageNum + ")\" class=\"btn btn-danger\">删除</button></td>");

        tableTr.push("</tr>");
        table.push(tableTr.join(""));
    }
    table.push("</table>");
    return table.join("");
}


/**
 * 删除留言
 * @param id 留言id
 * @param pageNum 当前页
 */
function deleteMessage(id, pageNum) {
    if (confirm("确认删除该留言？")) {
        alert(ajaxdata("/blogmanage/deleteBlogMessage", id).state);
        querySubmit(pageNum);
    }
}





