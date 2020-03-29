AUI().ready('liferay-sign-in-modal', 'event-outside', 'transition', function(A) {
    // **** ACTIONS ON SCROLL ****
    $(window).scroll(function () {
        // ===== Show / Hide Sticky Menu and Scroll To Top ==== 
        if ($(document).scrollTop() > 150 ) {
            A.one('.go-top').show(true);
        } 
        else {
            A.one('.go-top').hide(true);
        }
    });
    
    // **** ACTIONS ON LOAD ****
    // ===== Hide preloader ====
    preloader = A.one('.preloader');
    if (preloader) { preloader.addClass('preloader-deactivate'); }

    // ===== Scroll to Top on Arrow Click ==== 
    var go_top = A.one('.go-top');
    if (go_top){
        go-top.on('click', function() { 
            $('body,html').animate({ scrollTop : 0 }, 500);
        });
    }

    // ===== Sytle Status Widget ====
    var portlet_status = A.one('#portlet-status');
    if (portlet_status) { portlet_status.addClass("container").addClass("pb-70"); }
    
    // ===== Set Copyright year ====
    var s_year = A.one('#spanYear');
    if(s_year) { s_year.html(new Date().getFullYear()); }

    // ===== Search Bar ====
    $('.financial-nav').on('click', '.search-toggle', function(e) {
        var selector = $(this).data('selector');
      
        $(selector).toggleClass('show').find('.search-bar-keywords-input').focus();
        $(this).toggleClass('active');
        $(this).find('.icon').toggleClass('icon-search').toggleClass('icon-remove');
      
        e.preventDefault();
    });

});