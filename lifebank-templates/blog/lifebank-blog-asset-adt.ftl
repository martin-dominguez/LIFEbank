<!-- Blogs Application Template for Asset Publisher
    @project: LIFEbank
    @date: 25/4/2020
    @author: martin.dominguez@liferay.com
-->
<style>
    /*================================================
    Blog Area CSS
    =================================================*/
    .single-blog-post {
      background: #ffffff;
      position: relative;
      -webkit-transition: 0.5s;
      transition: 0.5s;
      margin-bottom: 30px;
      -webkit-box-shadow: 0 2px 48px 0 rgba(0, 0, 0, 0.08);
              box-shadow: 0 2px 48px 0 rgba(0, 0, 0, 0.08);
    }
    
    .single-blog-post .blog-image {
      position: relative;
    }
    
    .single-blog-post .blog-image img {
        object-fit: cover;
        height: 200px;
    }
    
    .single-blog-post .blog-image a {
      display: block;
    }
    
    .single-blog-post .blog-post-content {
      -webkit-transition: 0.5s;
      transition: 0.5s;
      padding: 30px 30px 0px 30px;
      min-height: 241px;
    }
    
    .single-blog-post .blog-post-content h3 {
      line-height: 30px;
      font-size: 20px;
    }
    
    .single-blog-post .blog-readmore {
        padding: 30px 30px 15px;
    }
    
    .single-blog-post .blog-readmore .fin-btn {
      font-size: 13px;
      font-weight: 500;
    }
    
    .single-blog-post .blog-post-footer {
      padding: 0px 30px 20px 30px;
    }
    .single-blog-post .blog-post-footer a {
      color: #ee0979;
    }
    
    .single-blog-post:hover {
      -webkit-transform: translateY(-7px);
              transform: translateY(-7px);
      -webkit-box-shadow: 0 2px 48px 0 rgba(0, 0, 0, 0.08);
              box-shadow: 0 2px 48px 0 rgba(0, 0, 0, 0.08);
      background-color: #ffffff;
    }
    
    ul.entry-meta {
      list-style-type: none;
      padding: 0;
      margin: 0 0 5px;
      line-height: 1;
    }
    
    ul.entry-meta li {
      display: inline-block;
      font-size: 13px;
      color: #57647c;
      line-height: 1;
      margin-right: 15px;
      margin-bottom: 10px;
      font-weight: 300;
    }
    
    ul.entry-meta li:last-child {
      margin-right: 0;
    }
    
    ul.entry-meta li a {
      color: #57647c;
      text-decoration: none;
      display: inline-block;
      text-transform: capitalize;
    }
    
    ul.entry-meta li a:hover {
      color: #ee0979;
    }
    
    ul.entry-meta li i {
      padding-right: 6px;
      font-style: normal;
      color: #ee0979;
    }
</style>
<section class="home-blog">
	<#if !entries?has_content>
		<#if !themeDisplay.isSignedIn()>
			${renderRequest.setAttribute("PORTLET_CONFIGURATOR_VISIBILITY", true)}
		</#if>
		<div class="alert alert-info">
			<@liferay_ui["message"] key="These are not the blogs you are looking for." />
		</div>
		
	<#else>
	    <div class="row">
    	<#list entries as curEntry>
    	    <#assign
    			assetRenderer = curEntry.getAssetRenderer()
    			blogEntry = assetRenderer.getAssetObject()
                entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale))
                viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry)
    	    />
            <#if assetLinkBehavior != "showFullContent">
                <#if (assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL))??>
                    <#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
                </#if>
            </#if>
    	    
    	    <div class="col-lg-4 col-md-6 ${curEntry?is_last?then('offset-lg-0 offset-md-3','')}">
    	        <div class="single-blog-post">
    	            <#if (blogEntry.getCoverImageURL(themeDisplay))??>	
						<div class="blog-image">
							<a href="${viewURL}" title="image-link">
								<img src="${blogEntry.getCoverImageURL(themeDisplay)}" alt="thumbnail" />
							</a>
						</div>
					</#if>
                    <div class="blog-post-content">
                        <ul class="entry-meta">
                            <li>
	                            <@liferay_ui["user-portrait"]
									size="sm"
									userId=curEntry.userId
									userName=curEntry.userName
								/>
								<#if serviceLocator??>
									<#assign 
									    userLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.UserLocalService")
                      entryUser = userLocalService.fetchUser(curEntry.getUserId())
									/>

									<#if entryUser?? && !entryUser.isDefaultUser()>
										<#assign entryUserURL = entryUser.getDisplayURL(themeDisplay) />
									</#if>
								</#if>
								<a href="${(entryUserURL?? && validator.isNotNull(entryUserURL))?then(entryUserURL, "")}">${curEntry.getUserName()}</a>
	                        </li>
	                        <li>
	                            <i class="icon icon-calendar"></i>
                    		    ${dateUtil.getDate(blogEntry.getDisplayDate(), "dd/MMM/yyyy", locale)}

								<#if serviceLocator??>
									<#assign
										assetEntryLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetEntryLocalService")

										assetEntry = assetEntryLocalService.getEntry("com.liferay.blogs.model.BlogsEntry", curEntry.getEntryId())
									/>
								</#if>
	                       </li>
	                    </ul>
						
	                    <h3>
    	                   <a href="${viewURL}">
    					   ${entryTitle}
    					   </a>
	                    </h3>
	                   
	                   
	                    <#if validator.isNotNull(curEntry.getDescription())>
							<#assign content = curEntry.getDescription() />
						<#else>
							<#assign content = blogEntry.getContent() />
						</#if>

						<p>${stringUtil.shorten(htmlUtil.stripHtml(content), 150)}...</p>
	                </div>
	                <div class="blog-readmore">
	                    <a class="fin-btn fin-btn-primary" href="${viewURL}">
	                        <@liferay_ui["message"] key="Read More" />
	                    </a>
                    </div>
                    
	                <div class="blog-post-footer">
						<div class="row">
							<div class="autofit-float autofit-row autofit-row-center widget-toolbar">

								<div class="autofit-col autofit-col-end">
									<#assign bookmarkURL = renderResponse.createRenderURL() />

									${bookmarkURL.setWindowState(windowStateFactory.getWindowState("NORMAL"))}
									${bookmarkURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}

									<@liferay_social_bookmarks["bookmarks"]
										className="com.liferay.blogs.model.BlogsEntry"
										classPK=curEntry.getEntryId()
										maxInlineItems=0
										target="_blank"
									    size="sm"
										title=entryTitle
										url=portalUtil.getCanonicalURL(bookmarkURL.toString(), themeDisplay, themeDisplay.getLayout())
									/>
								</div>
							</div>
						</div>
					</div>
	            </div>
			</div>
    	</#list>
    	</div>
    </#if>
</section>