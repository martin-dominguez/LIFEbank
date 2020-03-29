<div id="navbar" class="navbar-area sticky-${show_sticky_header?c}">
    <div class="financial-nav">
        <div class="container">
            <#if show_header_search>
                <#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />
                <@liferay.search_bar default_preferences="${preferences}" />
			</#if>
            <nav class="navbar navbar-expand-md">
                <a class="navbar-brand" href="${site_default_url}">
                    <img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />
                    <img alt="${logo_description}" class="mr-2" height="50" src="${sticky_logo}" />
                    <#if show_site_name>
							<h1 class="font-weight-light ml-1 mb-0 text-dark text-uppercase">${site_name}</h1>
					</#if>
                </a>
                <button type="button" class="navbar-toggle navbar-toggler-right collapsed" data-toggle="collapse" data-target="#navbarSupportedContent" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <#assign preferences = freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
                    <@liferay_portlet["runtime"]
                        defaultPreferences=preferences
                        instanceId="primary_navigation"
                        portletName="com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet"
                    />
                    <div class="others-options">
                        <@liferay.user_personal_bar />
                    </div>
                </div>
                 <#if show_header_search>
                    <div class="search-button">
                        <a href="#" class="search-toggle" data-selector=".financial-nav">
                            <i class="icon icon-search"></i>
                        </a>
                    </div>
                </#if>
            </nav>
        </div>
    </div>
</div>