$(document).ready(function () {
    $(".height_max").css("min-height",$(document).height());
    $('#div_blogTypeShow').imagesLoaded()
        /*.always( function( instance ) {    //always事件，在所有图片都加载完成（成功与否不论）时触发
            //console.log('all images loaded');
        })
        .done( function( instance ) {    //done事件，在所有图片都加载成功时触发
            //console.log('all images successfully loaded');
        })
        .fail( function() {    //fail事件，在所有图片都加载完成，并且至少有一张图片加载失败时触发
            //console.log('all images loaded, at least one is broken');
        })*/
        .progress( function( instance, image ) {    //progress事件，在每一张图片加载完成时都触发一次
            // var result = image.isLoaded ? 'loaded' : 'broken';    //判断当前图片加载成功与否
            //console.log( 'image is ' + result + ' for ' + image.img.src );
            $("#div_blogTypeShow img[id='"+image.img.id+"']").jqthumb({
                width : '100%',//宽度
                height : '300px',//高度
                //position : { y: '50%', x: '50%'},//从图片的中间开始产生缩略图
                zoom : '1',//缩放比例
                method : 'auto'//提交方法，用于不同的浏览器环境，默认为‘auto’
            });
        });
});
