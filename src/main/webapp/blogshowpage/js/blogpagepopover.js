/**
 * Created by DELL on 2019/4/25.
 */

$(document).ready(function () {

    $(function () {
        $('[data-toggle="popoverhov"]').each(function () {
            var element = $(this);
            var txt = element.html();
            element.popover({
                trigger: 'manual',
                placement: 'top', //top, bottom, left or right
                html: 'true',
            }).on("mouseenter", function () {
                var _this = this;
                $(this).popover("show");
                $(this).siblings(".popover").on("mouseleave", function () {
                    $(_this).popover('hide');
                });
            }).on("mouseleave", function () {
                var _this = this;
                setTimeout(function () {
                    if (!$(".popover:hover").length) {
                        $(_this).popover("hide")
                    }
                }, 100);
            });
        });
    });


});

