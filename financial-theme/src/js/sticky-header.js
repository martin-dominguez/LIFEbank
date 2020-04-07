AUI().ready('liferay-sign-in-modal', 'event-outside', 'transition', function(A) {   
    // **** LOGIN MENU ****
    var fix_menu = A.one('.fix-menu');
    var portlet_login = A.one('.portlet-login');
    var portlet_status = A.one('#portlet_status');
    var portlet_notifications = A.one(".notifications-portlet");
    var portlet_my_account = A.one("#portlet_com_liferay_my_account_web_portlet_MyAccountPortlet")
    
    if ((portlet_login || portlet_status || portlet_notifications || portlet_my_account) && (fix_menu)) {
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