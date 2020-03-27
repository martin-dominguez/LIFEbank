AUI().ready('liferay-sign-in-modal', 'event-outside', 'transition', function(A) {    
    // **** ACTIONS ON LOAD ****
    A.one('.preloader').addClass('preloader-deactivate');

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

    // **** COMMON FUNCTIONS ****
    // ===== Scroll to Top on Arrow Click==== 
    A.one('.go-top').on('click', function() { 
        $('body,html').animate({ scrollTop : 0 }, 500);
    });
    
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