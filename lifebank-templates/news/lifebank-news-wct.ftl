<!-- Web Content template for LIFEbank
    Structure: News

    @project: LIFEbank
    @date: 24/3/2020
    @author: martin.dominguez@liferay.com
-->
<section id="content-wrap" class="blog-single">
  <div class="row">
    <div class="col-twelve">
      <article class="format-standard">
        <div class="content-media">
          <div class="post-thumb">
            <#if Image11qr.getData()?? && Image11qr.getData() != "">
            	<img alt="${Image11qr.getAttribute("alt")}" data-fileentryid="${Image11qr.getAttribute("fileEntryId")}" src="${Image11qr.getData()}" />
            </#if>
          </div>
        </div>
        <div class="primary-content">
          <h1 class="page-title">Hey, This Is A Standard Format Post.</h1>
          <ul class="entry-meta">
            <li class="date">
                <#assign Datehu65_Data = getterUtil.getString(Datehu65.getData())>
                <#if validator.isNotNull(Datehu65_Data)>
                	<#assign Datehu65_DateObj = dateUtil.parseDate("yyyy-MM-dd", Datehu65_Data, locale)>
                	${dateUtil.getDate(Datehu65_DateObj, "dd/MMM/yyyy", locale)}
                </#if>
            </li>
            <li class="cat">${Author.getData()}</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>