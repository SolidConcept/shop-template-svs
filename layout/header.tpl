{extends file="{$parent_template_path}/layout/header.tpl"}

{block name='layout-header-head-resources' prepend}
    <script src="https://ccm19.solidconcept.de/ccm19/app.js?apiKey=d62f4013c01284f2384873c97df7dad78c367dddd74ac7b8&amp;domain=9087eb7" referrerpolicy="origin"></script>


    {* TMP *}
    <link rel="stylesheet" href="/shop/templates/svs_v5/themes/svs/meganav.css">
    <link rel="stylesheet" href="/shop/templates/svs_v5/themes/svs/meganav-custom.css">
{/block}


{block name='layout-header-head-title'}
    {if !empty($Artikel->cName) && !empty($Artikel->cHersteller)}
        {$Artikel->cHersteller} | 
        {if $meta_title|strstr:$Artikel->cHersteller && strpos($meta_title, $Artikel->cHersteller)==0}
            {$meta_title|replace:$Artikel->cHersteller:''} | 
        {else}
            {$meta_title} | 
        {/if}
    {else if !empty($meta_title)} 
        {$meta_title} | 
    {else if !empty($Link->getSEO())}
        {$Link->getSEO()} | 
    {/if}
    Funkhersteller SVS Funk
{/block}

{block name="layout-header-head-meta" append}
    {* CCM19 *}
    {literal}
    <script src="https://ccm19.solidconcept.de/ccm19/app.js?apiKey=d62f4013c01284f2384873c97df7dad78c367dddd74ac7b8&amp;domain=9087eb7" referrerpolicy="origin"></script>
    <script type="text/javascript">(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-N65MKXQ');</script> 
    {/literal}
{/block}


{block name='layout-header-header' prepend}
    {* Alert Banner *}
    {*{if $smarty.session.kSprache == 1}
        <div role="alert" class="alert alert-warning" id="headerInfo" >
            <i class="fas fa-info-circle"></i> <strong>Aufgrund eines Serverumzuges haben wir derzeit Probleme mit der E-Mail-Erreichbarkeit.</strong> <br>
            Bitte rufen Sie uns in dringenden Fällen an <a href="tel:+49712492860"><strong>+49 (0)7124 9286 0</strong></a>
        </div>
    {else}
        <div role="alert" class="alert alert-warning" id="headerInfo" >
            <i class="fas fa-info-circle"></i> <strong>We are currently having problems with email accessibility due to a server move.</strong> <br>
            In urgent cases, please call us <a href="tel:+49712492860"><strong>+49 (0)7124 9286 0</strong></a>
        </div>
    {/if}*}
    {* {if $smarty.session.kSprache == 1}
        <div role="alert" class="alert alert-warning" id="headerInfo" >
            <i class="fas fa-info-circle"></i> <strong>Information zum aktuellen Verkauf</strong> - Aktuell können wir keinen regulären Verkauf unserer Ware anbieten. <br> Bei Interesse an unseren Artikeln, senden Sie uns gerne eine Anfrage per <a href="mailto:home@svs-funk.com"><strong>E-Mail</strong></a>.
        </div>
    {else}
        <div role="alert" class="alert alert-warning" id="headerInfo" >
            <i class="fas fa-info-circle"></i> <strong>Information on the current sale</strong> - We are currently unable to offer regular sales of our goods. <br> If you are interested in our articles, please send us an <a href="mailto:home@svs-funk.com"><strong>enquiry by e-mail</strong></a>.
        </div>
    {/if} *}
{/block}