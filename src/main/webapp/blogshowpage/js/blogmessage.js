function addBlogMessage() {
    var blogMessage = {
        name: $("#messageName").val(),
        email: $("#messageEmail").val(),
        content: $("#messageContent").val()
    };
    console.log(JSON.stringify(blogMessage));
    var ajdata = ajaxdata("/blogpage/addBlogMessage",blogMessage);
    alert(ajdata.state);
}