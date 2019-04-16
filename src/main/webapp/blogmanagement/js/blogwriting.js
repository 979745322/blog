var ue = UE.getEditor('myEditor');
ue.ready(function () {
    $(".edui-editor-messageholder.edui-default").css({"visibility": "hidden"});
    // ue.setHeight(500);
    if ($('#blogId').val() !== "") {
        ue.setContent($("#div_blog_content")[0].innerHTML);
    }
    //设置编辑器的内容
    // ue.setContent('hello');
    // //获取html内容，返回: <p>hello</p>
    // var html = ue.getContent();
    // //获取纯文本内容，返回: hello
    // var txt = ue.getContentTxt();
});

/**
 * 发表博客
 */
function publishBlog() {
    var blog = {
        id: $('#blogId').val(),
        blogTitle: $('#blogTitle').val(),
        blogType: $('#blogType').val(),
        blogState: $('#blogState').val(),
        blogContent: ue.getContent()
    };
    var stateMsg = ajaxdata("/blogmanage/addBlog", blog).state;
    alert(stateMsg);
    if (stateMsg === "新增成功" || stateMsg === "修改成功") {
        window.location = "/blogmanage/blogList";
    }
}



