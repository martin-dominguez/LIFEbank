AUI().ready('liferay-sign-in-modal', 'event-outside', 'transition', function(A) {   
    // **** LOGIN MENU ****
    var portlet_status = A.one('#portlet-status');
    
    if (portlet_status) {
        A.one('.navbar-area').addClass('is-sticky');
    } else {
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
    }
});