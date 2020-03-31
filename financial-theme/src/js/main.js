AUI().ready('liferay-sign-in-modal', 'event-outside', 'transition', function(A) {

    var go_top = A.one('.go-top');

    // **** ACTIONS ON SCROLL ****
    $(window).scroll(function () {
        // ===== Show / Hide Sticky Menu and Scroll To Top ==== 
        if (go_top) {
            if ($(document).scrollTop() > 150 ) {
                go_top.show(true);
            } 
            else {
                go_top.hide(true);
            }
        }
    });
    
    // **** ACTIONS ON LOAD ****
    // ===== Hide preloader ====
    preloader = A.one('.preloader');
    if (preloader) { preloader.addClass('preloader-deactivate'); }

    // ===== Scroll to Top on Arrow Click ==== 
    if (go_top){
        go_top.on('click', function() { 
            $('body,html').animate({ scrollTop : 0 }, 500);
        });
    }

    // ===== Sytle Status & Login Widgets ====
    var control_menu = A.one('.has-control-menu');
    var portlet_status = A.one('#portlet_status');
    var portlet_login = A.one('.portlet-login');
    if (control_menu) {
        if (portlet_status) { portlet_status.addClass("container").addClass("mt-11"); }
        if (portlet_login) { portlet_login.addClass("container").addClass("mt-11"); }
    } else {
        if (portlet_status) { portlet_status.addClass("container").addClass("mt-8"); }
        if (portlet_login) { portlet_login.addClass("container").addClass("mt-8"); }
    }
    
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