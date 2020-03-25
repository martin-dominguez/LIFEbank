<footer class="footer-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-sm-6 col-md-6">
                <div class="single-footer-widget">
                    <div class="logo">
                        <a class="navbar-brand" style="float: none;" href="#" >LIFE<span class="bank">bank</span></a>
                        <p>Quis ipsum suspendisse ultrices gravida commodo. Risus commodo veliliee vel viverra maecenas accumsan lacus vel facilisis</p>
                    </div>
                    <ul class="social-links">
                        <li><a target="_blank" href="#"><i class="icon icon-facebook"></i></a></li>
                        <li><a target="_blank" href="#"><i class="icon icon-twitter"></i></a></li>
                        <li><a target="_blank" href="#"><i class="icon icon-instagram"></i></a></li>
                        <li><a target="_blank" href="#"><i class="icon icon-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 col-md-6">
                <div class="single-footer-widget">
                    <#if show_footer_company_navigation>
                        <#assign preferences = freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "borderless") />

                        <@liferay_portlet["runtime"]
                            defaultPreferences=preferences
                            instanceId="company_navigation"
                            portletName="com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet"
                        />
                    </#if>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 col-md-6">
                <div class="single-footer-widget">
                    <#if show_footer_support_navigation>
                        <#assign preferences = freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "borderless") />

                        <@liferay_portlet["runtime"]
                            defaultPreferences=preferences
                            instanceId="support_navigation"
                            portletName="com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet"
                        />
                    </#if>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 col-md-6">
                <div class="single-footer-widget">
                    <h2>Address</h2>
                    <ul class="footer-contact-info">
                        <li><span class="mr-1">Location:</span>27 Division St, New York, NY 10002, USA</li>
                        <li><span class="mr-1">Email:</span>infohaiper@haiper.com</li>
                        <li><span class="mr-1">Phone:</span>+ (321) 984 754</li>
                        <li><span class="mr-1">Fax:</span>+1-212-9876543</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="copyright-area">
            <p>© <span id="spanYear">2020</span> Liferay - All rights Reserved</p>
        </div>
    </div>
</footer>
<div class="preloader"><div class="loader"><div class="shadow"></div><div class="box"></div></div></div>
<div class="go-top"><i class="icon icon-arrow-up"></i></div>