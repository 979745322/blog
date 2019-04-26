$(document).ready(function () {
    $("#iframe_welcome").css("min-height",$(document).height());
    $("#iframe_welcome").css("min-width",$(document).width());
});
function addAccess() {
    $.ajax({
        async: true, // 异步
        url: "/blogpage/addAccess",
        data: "",
        contentType: 'application/json; charset=UTF-8',
        type: "POST",
        dataType: "json",
        success: function (data) {
            alert("aaaa");
        },
        error: function (data) {
            alert("ajaxerror");
        }
    });
}