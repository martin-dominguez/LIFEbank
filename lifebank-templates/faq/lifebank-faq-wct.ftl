<!-- Web Content template for LIFEbank
    Structure: FAQ

    @project: LIFEbank
    @date: 24/4/2020
    @author: martin.dominguez@liferay.com

    based in Kris Patefield work
-->
<style>
    /*================================================
    FAQ Area CSS
    =================================================*/
    .faq-content h2 {
        margin-bottom: 25px;
        position: relative;
        padding-bottom: 10px;
        border-bottom: 1px solid #eeeeee;
        font-size: 24px;
        overflow: visible;
    }
    .faq-content h2::before {
        content: '';
        position: absolute;
        background: -webkit-gradient(linear, left top, right top, from(#ee0979), to(#ff6a00));
        background: linear-gradient(90deg, #ee0979 0%, #ff6a00 100%);
        bottom: -1px;
        left: 0;
        width: 50px;
        height: 2.2px;
    }
    .faq-questions .faq-item {
      display: block;
      -webkit-box-shadow: 0 0 1.25rem rgba(108, 118, 134, 0.1);
              box-shadow: 0 0 1.25rem rgba(108, 118, 134, 0.1);
      background: #ffffff;
      margin-bottom: 10px;
    }
    
    .faq-questions .faq-item:last-child {
      margin-bottom: 50px;
    }
    .faq-questions .faq-item .drop-question {
      padding: 12px 20px 12px 20px;
      color: #212529;
      position: relative;
      border-bottom: 1px solid transparent;
      margin-bottom: -1px;
      display: block;
      font-size: 15px;
      font-weight: 500;
      font-family: "Raleway", sans-serif;
    }
    .faq-questions .faq-item .drop-answer {
      position: relative;
      padding: 0 30px 20px 30px;
      font-size: 15px;
    }
</style>
<div class="faq-content">
<#if GlobalHeader.getSiblings()?has_content>
	<#list GlobalHeader.getSiblings() as cur_GlobalHeader>
	<h2 class="global-header">${cur_GlobalHeader.getData()}</h2>
    	<div class="faq-questions">
        	<#list cur_GlobalHeader.Section.getSiblings() as cur_Section>
        	<div class="faq-item">
        		<div class="drop-question" data-toggle="collapse" data-target="#collapse-area-${cur_Section.getData()}">
        		    ${cur_Section.Question.getData()}
        		    <svg aria-hidden="true" class="lexicon-icon lexicon-icon-caret-top">
    				<use xlink:href="/o/classic-theme/images/lexicon/icons.svg#caret-bottom" />
                </div>
        		</div>
        		<div class="drop-answer collapse" id="collapse-area-${cur_Section.getData()}">
        		    ${cur_Section.Answer.getData()}
        		    <a href="${cur_Section.Link.getFriendlyUrl()}" class="answer-link">Read more...</a>
    			</div>    		
        	</div>
        	
        	</#list>
        </div>
	</#list>
</#if>
</div>