<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key='lang.dir' />" lang="${w3c_language_id}">
	<head>
		<title>${the_title} - ${company_name}</title>
		<meta content="initial-scale=1.0, width=device-width" name="viewport" />
		<@liferay_util["include"] page=top_head_include />
	</head>

	<body class="${css_class}">
		<@liferay_ui["quick-access"] contentId="#main-content" />

		<@liferay_util["include"] page=body_top_include />

		<#if is_signed_in>
			<@liferay.control_menu />
		</#if>

		<div id="wrapper" class="pt-0">
			<#if show_header>
				<#include "${full_templates_path}/header.ftl" />
			</#if>

			<main id="content" role="main" class="${portal_content_css_class}">
				<#if selectable>
					<@liferay_util["include"] page=content_include />
				<#else>
					${portletDisplay.recycle()}
			
					${portletDisplay.setTitle(the_title)}
			
					<@liferay_theme["wrap-portlet"] page="portlet.ftl">
						<@liferay_util["include"] page=content_include />
					</@>
				</#if>
			</main>
			
			<#if show_footer>
				<#include "${full_templates_path}/footer.ftl" />
			</#if>

		</div>

		<@liferay_util["include"] page=body_bottom_include />

		<@liferay_util["include"] page=bottom_include />
		<#if show_sticky_header>
			<#if fix_menu_login_status>
				<div class="fix_menu_login_status"></div>
			</#if>
			<script type="text/javascript" src="${sticky_js_file}"></script>
		</#if>
		<div class="preloader"><div class="loader"><div class="shadow"></div><div class="box"></div></div></div>
		<div class="go-top"><i class="icon icon-arrow-up"></i></div>
	</body>
</html>