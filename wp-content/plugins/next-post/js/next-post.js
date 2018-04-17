    //
    // jQuery(function ($) {
    //
    //     $("#next-button").on('click', function () {
    //         var pre_post = $(".pre-post-id").attr('id');
    //
    //         var data = {
    //             action: 'next_post_ajax',
    //             pre_post: pre_post
    //         };
    //
    //         $.post(url_obj.ajax_url, data).always(function (response) {
    //             if (response.post_content !== '') {
    //                 $('#post-wrap').html(response.post_content);
    //             }
    //
    //         });
    //
    //     });
    //
    // });

function next_post() {
    var pre_post = $(".pre-post-id").attr('id');

    var data = {
        action: 'next_post_ajax',
        pre_post: pre_post
    };

    $.post(url_obj.ajax_url, data).always(function (response) {
        if (response.post_content !== '') {
            $('#post-wrap').html(response.post_content);
        }else {
            $('#post-wrap').html('<h1>Vist Blog</h1>');
        }

    });

}