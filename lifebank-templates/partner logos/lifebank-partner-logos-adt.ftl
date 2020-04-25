<!-- Blogs Application Template for Asset Publisher
    Web Content Template: Partner Logos
    
    @project: LIFEbank
    @date: 25/3/2020
    @author: martin.dominguez@liferay.com
-->
<style>
    /*================================================
    Partner Area CSS
    =================================================*/
    .partner-inner .journal-content-article {
        margin: auto;
    }
    
    .single-partner-item {
      text-align: center;
      margin-bottom: 10px;
      -ms-flex: 0 0 20%;
      -webkit-box-flex: 0;
              flex: 0 0 20%;
      padding-left: 5px;
      padding-right: 5px;
    }
    
    .single-partner-item a {
      display: block;
      position: relative;
      overflow: hidden;
      border-radius: 5px;
      padding: 20px;
    }
    
    .single-partner-item a picture:nth-child(1) img {
      position: relative;
      display: inline-block !important;
      width: auto !important;
      -webkit-transition: -webkit-transform .4s ease;
      transition: -webkit-transform .4s ease;
      transition: transform .4s ease;
      transition: transform .4s ease, -webkit-transform .4s ease;
    }
    
    .single-partner-item a picture:nth-child(2) img {
      position: absolute;
      top: 50%;
      left: 50%;
      -webkit-transform: translate(-50%, 200%);
              transform: translate(-50%, 200%);
      -webkit-transition: -webkit-transform .4s ease;
      transition: -webkit-transform .4s ease;
      transition: transform .4s ease;
      transition: transform .4s ease, -webkit-transform .4s ease;
      display: inline-block !important;
      width: auto !important;
    }
    
    .single-partner-item a:hover picture:nth-child(1) img {
      -webkit-transform: translateY(-200%);
              transform: translateY(-200%);
    }
    
    .single-partner-item a:hover picture:nth-child(2) img {
      -webkit-transform: translate(-50%, -50%);
              transform: translate(-50%, -50%);
    }
</style>
<!-- FREMARKER CODE -->
<#if entries?has_content>
    <section class="partner-inner">
        <div class="row align-items-center">
            <#list entries as curEntry>
               <#assign 
                   assetRenderer = curEntry.getAssetRenderer()
                   journalArticle = assetRenderer.getAssetObject() 
                />
                <@liferay_journal["journal-article"]
                    articleId=journalArticle.getArticleId()
                    ddmTemplateKey="35693"
                    groupId=journalArticle.getGroupId()
                />
            </#list>
        </div>
    </section>
<#else>
    <#if !themeDisplay.isSignedIn()>
		${renderRequest.setAttribute("PORTLET_CONFIGURATOR_VISIBILITY", true)}
	</#if>
	<div class="alert alert-info">
		<@liferay_ui["message"] key="These are not the logos you are looking for." />
	</div>
</#if>