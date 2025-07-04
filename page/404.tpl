{extends file="../../NOVA/page/404.tpl"}

{block name='page-404'}
    <div id="page-not-found">
        {* {block name='page-404-include-sitemap'}
            {include file='page/sitemap.tpl'}
        {/block} *}
        <div class="alertWrapper">
            <div class="alertBox">
                <h1><strong>{lang key='alertHeadline' section='custom'}</strong></h1> 
                <p class="h4">{lang key='alertContent' section='custom'}</p>
                <p><a class="btn btn-secondary" href="{lang key='alertLink' section='custom'}">{lang key='alertBtnBack' section='custom'}</a></p>
            </div>
            <div class="alertBox grey">
                <h2 class="h4"><strong>{lang key='alertContact' section='custom'}</strong></h2>
                <p><strong>SVS Nachrichtentechnik GmbH</strong><br>Zeppelinstraße 10<br>72818 Trochtelfingen<br>Deutschland</p>
                <p class="btnWrapper"><a class="btn btn-primary tel" href="tel:0172492860">+49 (0)712492860</a> <a class="btn btn-primary email" href="mailto:home@svs-funk.de">home@svs-funk.de</a></p>
            </div>
        </div>
    </div>
{/block}
