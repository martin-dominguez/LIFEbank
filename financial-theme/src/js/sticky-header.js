AUI().ready('liferay-sign-in-modal', 'event-outside', 'transition', function(A) {    
    // **** ACTIONS ON SCROLL ****
    $(window).scroll(function () {
        // ===== Show / Hide Sticky Menu==== 
        if ($(document).scrollTop() > 60 ) {
            $('.navbar-area').addClass('is-sticky');
        } 
        else {
            $('.navbar-area').removeClass('is-sticky');
        }
    });
});