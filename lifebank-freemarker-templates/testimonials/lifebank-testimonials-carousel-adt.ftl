<!-- Asset Publisher Application Template
    @project: LIFEbank
    @date: 24/3/2020
    @author: martin.dominguez@liferay.com
-->
<style>
    /*================================================
    Feedback Area CSS
    =================================================*/
    .carousel-container {
        position: relative;
        max-width: 750px;
        margin: 0 auto;
    }

    .carousel-container .single-feedback {
        background: #ffffff;
        border-radius: 5px;
        position: relative;
        padding: 40px;
        text-align: center;
    }

    .carousel-container .single-feedback .quote-icon {
        font-size: 40px;
        margin-bottom: 20px;
        color: #44ce6f;
    }

    .carousel-container .single-feedback p {
        font-weight: 400;
        margin: 0;
        color: #5a5a5a;
    }

    .carousel-container .single-feedback .client-img {
        text-align: left;
        overflow: hidden;
        max-width: 250px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 25px;
    }

    .carousel-container .single-feedback .client-img img {
        border-radius: 50%;
        width: 70px;
        float: left;
        margin-right: 15px;
    }

    .carousel-container .single-feedback .client-img h3 {
        margin-bottom: 0;
        font-size: 18px;
        padding-top: 14px;
    }

    .carousel-container .single-feedback .client-img span {
        display: block;
        margin-top: 3px;
        font-weight: 300;
        font-size: 13px;
    }

    .carousel-container .carousel-nav {
        margin: 0 !important;
    }

    .carousel-container .carousel-nav .carousel-control-prev,
    .carousel-container .carousel-nav .carousel-control-next {
        position: absolute;
        top: 50%;
        -webkit-transform: translateY(-50%);
                transform: translateY(-50%);
        background-color: #fff !important;
        color: #44ce6f !important;
        width: 40px;
        height: 40px;
        line-height: 40px !important;
        padding: 0 !important;
        border-radius: 30px 0px 0px 30px !important;
        margin: 0 !important;
    }
    
    .carousel-container .carousel-nav .carousel-control-prev {
        left: -40px;
        border-radius: 30px 0px 0px 30px !important;
    }
    
    .carousel-container .carousel-nav .carousel-control-next {
        right: -40px;
        border-radius: 0 30px 30px 0 !important;
    }
    
    .carousel-container .carousel-nav .carousel-control-prev i,
    .carousel-container .carousel-nav .carousel-control-next i {
        padding-left: 2px;
    }

    .carousel-container .carousel-nav .carousel-control-prev:hover,
    .carousel-container .carousel-nav .carousel-control-next:hover {
        background-color: #44ce6f !important;
        color: #ffffff !important;
    }
    @media only screen and (max-width: 767px) {
        .carousel-container .carousel-nav .carousel-control-next {
            right: 0px;
        }
        .carousel-container .carousel-nav .carousel-control-prev {
            left: 0px;
        }
    }
</style>
<!-- FREMARKER CODE -->
<#if entries?has_content>
    <section class="carousel-container">
        <div id="<@portlet.namespace />-Carousel" class="carousel slide" data-ride="carousel">
            <!-- Wrapper for carousel items -->
            <div class="carousel-inner">
                <#list entries as curEntry>
                   <#assign 
                       assetRenderer = curEntry.getAssetRenderer()
                       journalArticle = assetRenderer.getAssetObject()      
                    />
                   
                    <div class="item carousel-item ${curEntry?is_first?then('active','')}">
                        <@liferay_journal["journal-article"]
                            articleId=journalArticle.getArticleId()
                            ddmTemplateKey="34735"
                            groupId=journalArticle.getGroupId()
                        />
                    </div>
                </#list>
            </div>
            <!-- Carousel controls -->
            <div class="carousel-nav">
                <a class="carousel-control left carousel-control-prev" href="#<@portlet.namespace />-Carousel" data-slide="prev">
                    <i class="icon-large icon-angle-left"></i>
                </a>
                <a class="carousel-control right carousel-control-next" href="#<@portlet.namespace />-Carousel" data-slide="next">
                    <i class="icon-large icon-angle-right"></i>
                </a>
            </div>
        </div>
    </section>
</#if>