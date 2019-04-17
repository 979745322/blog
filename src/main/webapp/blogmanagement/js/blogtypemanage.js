$(document).ready(function () {
    querySubmit(1);
    // 文件选择成功，显示文件名称
    $('#blogTypeImg').change(function () {
        uploadBlogTypeImg();
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
        blogType: $('#input_blogTypeName').val()
    };
    var pageInfo = ajaxdata("/blogmanage/blogTypePage", pageData).pageInfo;
    $("#div_blogTable").html(blogTable(pageInfo));
    pageInfoBar(pageInfo, "div_pageBar");
}

/**
 * 拼接查询博客类型列表
 * @param pageInfo 分页信息
 */
function blogTable(pageInfo) {
    var list = pageInfo.list;
    var table = [];
    table.push("<table class=\"table table-striped\">");
    var tableFirstTr = "<tr class=\"table_tr_title\">\n" +
        "                    <td>序号</td>\n" +
        "                    <td>博客类型</td>\n" +
        "                    <td>博客类型封面</td>\n" +
        "                    <td>博客类型描述</td>\n" +
        "                    <td>操作</td>\n" +
        "                </tr>";
    table.push(tableFirstTr);
    for (var i = 0; i < list.length; i++) {
        var num = (pageInfo.pageNum - 1) * pageInfo.pageSize + i + 1;
        var tableTr = [];
        tableTr.push("<tr>");
        // 序号
        tableTr.push("<td>" + num + "</td>");
        // 博客类型
        tableTr.push("<td>" + list[i].blogTypeName + "</td>");
        // 博客封面
        tableTr.push("<td><img class='img_blogTypeImg' src='/upload/" + list[i].blogTypeImg + "'></td>");
        // 博客描述
        var blogTypeDescription = list[i].blogTypeDescription.length > 20 ? list[i].blogTypeDescription.substring(0, 21) + "..." : list[i].blogTypeDescription;
        tableTr.push("<td>" + blogTypeDescription + "</td>");
        // 操作
        tableTr.push("<td>" +
            // "<button data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"detailBlog(" + list[i].id + ")\" class=\"btn btn-default\">查看</button>&nbsp;&nbsp;" +
            "<button data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"updateBlogType(" + list[i].id + ")\" class=\"btn btn-info\">编辑</button>&nbsp;&nbsp;" +
            "<button onclick=\"deleteBlog(" + list[i].id + "," + pageInfo.pageNum + ")\" class=\"btn btn-danger\">删除</button></td>");

        tableTr.push("</tr>");
        table.push(tableTr.join(""));
    }
    table.push("</table>");
    return table.join("");
}

/**
 * 新增博客类型按钮
 */
function addBlogTypeButton() {
    $('#modal_title_blogType').html("添加博客类型");
    clearBlogTypeForm();
}

/**
 * 添加博客类型
 */
function addBlogType() {
    if (($('#input_blogTypeImg').val() === "" || $('#input_blogTypeImg').val() === null) && !checkFile()) {
        alert('请选择博客类型封面');
        return false;
    }
    var blogType = {
        id: $('#blogTypeId').val(),
        blogTypeName: $('#blogTypeName').val(),
        blogTypeImg: $('#input_blogTypeImg').val(),
        blogTypeDescription: $('#blogTypeDescription').val()
    };
    var stateMsg = ajaxdata("/blogmanage/addBlogType", blogType).state;
    alert(stateMsg);
    if (stateMsg === "新增成功！" || stateMsg === "修改成功！") {
        $(".btn_blogType_close").click();
        querySubmit(1);
    }
}

// 上传博客类型封面图片 上传成功返回true，上传失败返回false
function uploadBlogTypeImg() {
    var file = checkFile();
    if (!file) {
        alert('请选择博客类型封面');
        return false;
    }

    // 构建form数据
    var formFile = new FormData();
    //把文件放入form对象中
    formFile.append("file", file);

    // ajax提交
    $.ajax({
        url: "/blogmanage/uploadBlogTypeImg",
        data: formFile,
        type: "POST",
        dataType: "JSON",
        processData: false,		//用于对data参数进行序列化处理 这里必须false
        contentType: false, 	//必须
        async: false,
        success: function (result) {
            console.log(result.state);
            if (result.state === "图片上传成功！") {
                $('#input_blogTypeImg').attr("value", file.name);
                $('#img_blogTypePreviewImg').attr("src", "/upload/" + file.name);
            }
        },
        error: function (result) {
            alert("ajax error")
        }
    });
}

// 检测是否选择文件，如果选择，返回文件对象;如果没选择，返回false
function checkFile() {

    // 获取文件对象(该对象的类型是[object FileList]，其下有个length属性)
    var fileList = $('#blogTypeImg')[0].files;
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
 */
function updateBlogType(id) {
    clearBlogTypeForm();
    $('#modal_title_blogType').html("修改博客类型");
    var blogType = ajaxdata("/blogmanage/selectBlogType", id).blogType;
    $('#blogTypeId').attr('value', blogType.id);
    $('#blogTypeName').attr('value', blogType.blogTypeName);
    $('#input_blogTypeImg').attr("value", blogType.blogTypeImg);
    $('#img_blogTypePreviewImg').attr("src", "/upload/" + blogType.blogTypeImg);
    $('#blogTypeDescription').html(blogType.blogTypeDescription);
}

/**
 * 清空博客类型表单
 */
function clearBlogTypeForm() {
    $('#div_detailType_body form')[0].reset();
    $('#blogTypeId').attr('value', "");
    $('#blogTypeName').attr('value', "");
    $('#input_blogTypeImg').attr("value", "");
    $('#img_blogTypePreviewImg').removeAttr("src");
    $('#blogTypeDescription').html("");
}
/**
 * 删除博客类型
 * @param id 博客id
 * @param pageNum 当前页
 */
function deleteBlog(id, pageNum) {
    if (confirm("确认删除该博客类型？")) {
        alert(ajaxdata("/blogmanage/deleteBlogType", id).state);
        querySubmit(pageNum);
    }
}





