/**
 * Created by DELL on 2019/4/22.
 */
$(document).ready(function () {
    // 文件选择成功，显示文件名称
    $('#blogPageImgUrl').change(function () {
        uploadBlogPageImg();
    });
});
// 上传博客类型封面图片 上传成功返回true，上传失败返回false
function uploadBlogPageImg() {
    var file = checkFile();
    if (!file) {
        alert('请选择博客首页滚动图');
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
                $('#input_blogPageImgUrl').attr("value", file.name);
                $('#img_blogPageImgUrl').attr("src", "/upload/" + file.name);
            }
        },
        error: function (result) {
            if (data.status === 401) {
                console.log("未登录");
                window.parent.location.href = "/blogmanage/login";
            } else {
                alert("ajax error");
            }
        }
    });
}

// 检测是否选择文件，如果选择，返回文件对象;如果没选择，返回false
function checkFile() {

    // 获取文件对象(该对象的类型是[object FileList]，其下有个length属性)
    var fileList = $('#blogPageImgUrl')[0].files;
    // 如果文件对象的length属性为0，就是没文件
    if (fileList.length === 0) {
        console.log('没选择文件');
        return false;
    }
    return fileList[0];
}
/**
 * 清空博客类型表单
 */
function clearBlogTypeForm() {
    $('#div_detailImg_body form')[0].reset();
    $('#blogPageImgId').attr('value', "");
    $('#blogPageImgTitle').html("");
    $('#blogPageImgUrl').attr('value', "");
    $('#input_blogPageImgUrl').attr('value', "");
    $('#img_blogPageImgUrl').removeAttr("src");
}

/**
 * 修改滚动图信息
 */
function updateBlogPageImg(id,imgTitle,imgUrl) {
    clearBlogTypeForm();
    $('#blogPageImgId').attr('value', id);
    $('#blogPageImgTitle').html(imgTitle);
    $('#blogPageImgUrl').attr('value', imgUrl);
    $('#input_blogPageImgUrl').attr('value', imgUrl);
    $('#img_blogPageImgUrl').attr("src","/upload/"+imgUrl);
}

/**
 * 修改滚动图信息
 */
function updateBlogPageImgAjax() {
    if (($('#input_blogPageImgUrl').val() === "" || $('#input_blogPageImgUrl').val() === null) && !checkFile()) {
        alert('请选择博客首页滚动图');
        return false;
    }
    var blogPageImg = {
        id: $('#blogPageImgId').val(),
        imgTitle: $('#blogPageImgTitle').val(),
        imgUrl: $('#input_blogPageImgUrl').val(),
    };
    var stateMsg = ajaxdata("/blogmanage/updateBlogPageImg", blogPageImg).state;
    alert(stateMsg);
    if (stateMsg === "修改成功！") {
        $(".btn_blogType_close").click();
        window.location.reload();
    }
}

