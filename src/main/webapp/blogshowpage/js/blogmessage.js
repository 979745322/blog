$(document).ready(function () {
    $(function () {
        $('[data-toggle="popover"]').each(function () {
            var element = $(this);
            var replyId = element.attr('replyId');
            var replyName = element.attr('replyName');
            var txt = element.html() + replyName;
            element.popover({
                trigger: 'click',
                placement: 'right', //top, bottom, left or right
                title: txt,
                html: 'true',
                content: ContentMethod(replyId, replyName)
            });
        });
    });

});

function ContentMethod(replyId, replyName) {
    return '<div class="row table_contact">\n' +
        '                <div class="col-md-12">\n' +
        '                    <div class="row">\n' +
        '                        <div class="col-md-8">\n' +
        '                            <div class="form-group">\n' +
        '                                <textarea name="" id="messageContent' + replyId + '" cols="30" rows="7" class="form-control"\n' +
        '                                          placeholder="有什么想回复' + replyName + '的，把它写下来"></textarea>\n' +
        '                            </div>\n' +
        '                        </div>\n' +
        '                        <div class="col-md-4">\n' +
        '                            <div class="form-group">\n' +
        '                                <input type="text" id="messageName' + replyId + '" class="form-control" placeholder="留言昵称">\n' +
        '                            </div>\n' +
        '                            <div class="form-group">\n' +
        '                                <input type="email" id="messageEmail' + replyId + '" class="form-control"\n' +
        '                                       placeholder="邮箱,仅用于提醒回复,不会公开">\n' +
        '                            </div>\n' +
        '                            <div class="form-group">\n' +
        '                                <input type="button" onclick="replyBlogMessage(' + replyId + ')" class="btn btn-primary btn-md"\n' +
        '                                       value="回复留言">\n' +
        '                            </div>\n' +
        '                        </div>\n' +
        '                    </div>\n' +
        '                </div>\n' +
        '            </div>';
}

function addBlogMessage() {
    var email = $("#messageEmail").val();
    if (email != null && email !== "") {
        var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        if (!reg.test(email)) {
            alert("如填写回复提醒邮箱，请填写正确的邮箱格式！");
            return false;
        }
    }
    var blogMessage = {
        name: $("#messageName").val(),
        email: email,
        content: $("#messageContent").val()
    };
    console.log(JSON.stringify(blogMessage));
    var ajdata = ajaxdata("/blogpage/addBlogMessage", blogMessage);
    alert(ajdata.state);
    if (ajdata.state === "发表成功！") {
        window.location.reload();
    }
}

function replyBlogMessage(replyId) {
    var email = $("#messageEmail" + replyId).val();
    if (email != null && email !== "") {
        var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        if (!reg.test(email)) {
            alert("如填写回复提醒邮箱，请填写正确的邮箱格式！");
            return false;
        }
    }
    var blogMessage = {
        name: $("#messageName" + replyId).val(),
        email: email,
        content: $("#messageContent" + replyId).val(),
        replyId: replyId
    };
    console.log(JSON.stringify(blogMessage));
    var ajdata = ajaxdata("/blogpage/addBlogMessage", blogMessage);
    alert(ajdata.state);
    if (ajdata.state === "发表成功！") {
        window.location.reload();
    }
}