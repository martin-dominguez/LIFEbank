<!-- Theme configuration -->
<#assign
	show_header = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-header"))
	show_sticky_header = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-sticky-header"))
	fix_menu_login_status = getterUtil.getBoolean(themeDisplay.getThemeSetting("fix-menu-login-status"))
	sticky_logo = getterUtil.getString(themeDisplay.getThemeSetting("sticky-logo"))
	show_header_search = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-header-search"))
	show_language_selector = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-language-selector"))
	show_footer = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-footer"))
	show_footer_company_navigation = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-footer-company-navigation"))
	show_footer_support_navigation = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-footer-support-navigation"))
	show_social_icons = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-social-icons"))
	facebook_url = getterUtil.getString(themeDisplay.getThemeSetting("facebook-url"))
	twitter_url = getterUtil.getString(themeDisplay.getThemeSetting("twitter-url"))
	instagram_url = getterUtil.getString(themeDisplay.getThemeSetting("instagram-url"))
	linkedin_url = getterUtil.getString(themeDisplay.getThemeSetting("linkedin-url"))
	wrap_widget_page_content = getterUtil.getBoolean(themeDisplay.getThemeSetting("wrap-widget-page-content"))
	location = getterUtil.getString(themeDisplay.getThemeSetting("location"))
	email = getterUtil.getString(themeDisplay.getThemeSetting("email"))
	phone = getterUtil.getString(themeDisplay.getThemeSetting("phone"))
	company_description = getterUtil.getString(themeDisplay.getThemeSetting("company-description"))
	show_preloader = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-preloader"))
	show_gotop_buttom = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-gotop-button"))
/>

<!-- Wrap Classes -->
<#if wrap_widget_page_content && (layout.getType() == "portlet")>
	<#assign portal_content_css_class = "container" />
<#else>
	<#assign portal_content_css_class = "" />
</#if>

<#assign css_class = css_class + " override-theme-colors" />

<!-- Sticky Header JS -->
<#if show_sticky_header>
	<#assign sticky_js_file = htmlUtil.escape(portalUtil.getStaticResourceURL(request, "${javascript_folder}/sticky-header.js")) />
<#else>
	<#assign sticky_js_file = "" />
</#if>
<#if sticky_logo?has_content>
	<#assign sticky_logo = sticky_logo />
<#else>
	<#assign sticky_logo = site_logo />
</#if>

<!-- Footer colums -->
<#assign footer_lg_class = "col-lg-" />
<#if show_footer>
	<#if show_footer_company_navigation>
		<#if show_footer_support_navigation>
			<#assign footer_lg_class = footer_lg_class + "3" />
		<#else>
			<#assign footer_lg_class = footer_lg_class + "4" />
		</#if>
	<#elseif show_footer_support_navigation>
		<#assign footer_lg_class = footer_lg_class + "4" />
	<#else>
		<#assign footer_lg_class = footer_lg_class + "6" />
	</#if>
</#if>
