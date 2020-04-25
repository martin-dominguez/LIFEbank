<!-- Web Content template for LIFEbank
    Structure Requirements:
     1. ClientImage <Image>
     2. name <text>
     3. Position <text>
     4. testimonial <textbox>

    @project: LIFEbank
    @date: 24/3/2020
    @author: martin.dominguez@liferay.com
-->
       
<div class="item">
    <div class="single-feedback">
        <i class="icon icon-quote-left quote-icon"></i>
        <p><q>${testimonial.getData()}</q></p>
        <div class="client-img">
            <#if ClientImage.getData()?? && ClientImage.getData() != "">
        	    <img alt="${ClientImage.getAttribute('alt')}" data-fileentryid="${ClientImage.getAttribute('fileEntryId')}" src="${ClientImage.getData()}" />
            </#if>
            <h3>${name.getData()}</h3><span>${Position.getData()}</span>
        </div>
    </div>
</div>