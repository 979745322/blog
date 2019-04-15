var ue = UE.getEditor('myEditor');
ue.ready(function () {
    $(".edui-editor-messageholder.edui-default").css({"visibility": "hidden"});
    ue.setHeight(500);
    if($('#blogId').val()!==""){
        ue.setContent($("#div_blog_content")[0].innerHTML);
    }
    // ue.setContent($("#div_blog_content")[0].innerHTML);
    // ue.setContent(${blog.blogContent});
    //设置编辑器的内容
    // ue.setContent('hello');
    // //获取html内容，返回: <p>hello</p>
    // var html = ue.getContent();
    // //获取纯文本内容，返回: hello
    // var txt = ue.getContentTxt();
});

function publishBlog() {
    var blog = {
        id: $('#blogId').val(),
        blogTitle: $('#blogTitle').val(),
        blogType: $('#blogType').val(),
        blogState: $('#blogState').val(),
        blogContent: ue.getContent()
    };
    console.log(JSON.stringify(blog));
    alert(ajaxdata("/blogmanage/addBlog",blog).state);
    window.location = "/blogmanage/blogList";
}



