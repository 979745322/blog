$(document).ready(function () {
    querySubmit(1);
    // 文件选择成功，显示文件名称
    $('#blogTypeImg').change(function(){

        var file = checkFile();
        if (!file) {
            return false;
        }
        var name = $('#blogTypeImg')[0].files[0].name;
        console.log(name);
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
        blogTitle: $('#input_blogTypeName').val()
    };
    /*var pageInfo = ajaxdata("/blogmanage/page", pageData).pageInfo;
    $("#div_blogTable").html(blogTable(pageInfo));
    $("#div_blogTable").trigger("create");
    pageInfoBar(pageInfo, "div_pageBar");*/
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
        switch (list[i].blogType) {
            case "1" :
                tableTr.push("<td>生活娱乐</td>");
                break;
            case "2" :
                tableTr.push("<td>技术笔记</td>");
                break;
        }
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
 * 添加博客类型
 */
function addBlogType(){
    var blogType = {
        id: $('#blogTypeId').val(),
        blogTypeName: $('#blogTypeName').val(),
        blogTypeImg: $('#blogTypeImg').val(),
        blogTypeDescription: $('#blogTypeDescription').val(),
    };
    console.log(JSON.stringify(blogType));

    var file = checkFile();
    if (!file) {
        alert('请先选择文件');
        return false;
    }

    // 构建form数据
    var formFile = new FormData();
    //formFile.append("action", "UploadPath");
    //把文件放入form对象中
    formFile.append("file", file);

    // ajax提交
    $.ajax({
        url: "/blogmanage/fileUpload",
        data: formFile,
        type: "POST",
        dataType: "JSON",
        processData: false,		//用于对data参数进行序列化处理 这里必须false
        contentType: false, 	//必须
        success: function(result){
            alert('上传成功');
        },
        error: function(result){
            alert('上传失败');
        }
    });
    /*var stateMsg = ajaxdata("/blogmanage/addBlog", blogType).state;
    alert(stateMsg);*/

}

// 检测是否选择文件，如果选择，返回文件对象;如果没选择，返回false
function checkFile(){

    // 获取文件对象(该对象的类型是[object FileList]，其下有个length属性)
    var fileList = $('#blogTypeImg')[0].files;
    console.log(fileList);
    // 如果文件对象的length属性为0，就是没文件
    if (fileList.length === 0) {
        console.log('没选择文件');
        return false;
    }
    return fileList[0];
}

/**
 * 编辑博客类型
 * @param id 博客类型id
 * @param pageNum 当前页
 */
function updateBlog(id,pageNum) {
    window.location="/blogmanage/updateBlog?id="+id;
}

/**
 * 删除博客类型
 * @param id 博客id
 * @param pageNum 当前页
 */
function deleteBlog(id, pageNum) {
    if(confirm("确认删除该博客类型？")){
        alert(ajaxdata("/blogmanage/deleteBlog",id).state);
        querySubmit(pageNum);
    }
}





