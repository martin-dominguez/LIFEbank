<#assign
	show_footer = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-footer"))
	show_footer_company_navigation = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-footer-company-navigation"))
	show_footer_support_navigation = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-footer-support-navigation"))
	show_header = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-header"))
	show_header_search = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-header-search"))
	show_language_selector = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-language-selector"))
	show_social_icons = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-social-icons"))
	twitter_url = getterUtil.getString(themeDisplay.getThemeSetting("twitter-url"))
	facebook_url = getterUtil.getString(themeDisplay.getThemeSetting("facebook-url"))
	youtube_url = getterUtil.getString(themeDisplay.getThemeSetting("youtube-url"))
	instagram_url = getterUtil.getString(themeDisplay.getThemeSetting("instagram-url"))
	show_sticky_header = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-sticky-header"))
	wrap_widget_page_content = getterUtil.getBoolean(themeDisplay.getThemeSetting("wrap-widget-page-content"))
/>

<#if wrap_widget_page_content && (layout.getType() == "portlet")>
	<#assign portal_content_css_class = "container mt-4" />
<#else>
	<#assign portal_content_css_class = "" />
</#if>

<#assign css_class = css_class + " override-theme-colors" />