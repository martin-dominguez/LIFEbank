jQuery(function( $ ){
    // **** ACTIONS ON LOAD ****
    $(window).on('load', function(){
        $('.preloader').addClass('preloader-deactivate');
    });

    // **** ACTIONS ON SCROLL ****
    $(window).scroll(function () {
        // ===== Show / Hide Sticky Menu and Scroll To Top ==== 
        if ($(document).scrollTop() > 150 ) {
            $('.navbar-area').addClass('is-sticky');
            $('.go-top').fadeIn(200);
        } 
        else {
            $('.navbar-area').removeClass('is-sticky');
            $('.go-top').fadeOut(200);
        }
    });

    // **** COMMON FUNCTIONS ****
    // ===== Scroll to Top on Arrow Click==== 
    $('.go-top').click(function() { 
        $('body,html').animate({ scrollTop : 0 }, 500);
    });
    
    // ===== Set Copyright year ====
    $('#spanYear').html(new Date().getFullYear());

    // ===== Search Bar ====
    $('.financial-nav').on('click', '.search-toggle', function(e) {
        var selector = $(this).data('selector');
      
        $(selector).toggleClass('show').find('.search-input').focus();
        $(this).toggleClass('active');
        $(this).find('.icon').toggleClass('icon-search').toggleClass('icon-remove');
      
        e.preventDefault();
    });

});
