{extends file="{$parent_template_path}/layout/footer.tpl"}

{block name='footer-sidepanel-left-content' prepend}
    <div class="search search-wrapper d-none d-lg-block">
        <form action="{$ShopURL}/search/" method="get">
            <div class="form-icon">
                {inputgroup}
                    {input id="search-header" name="qs" type="text" class="ac_input" placeholder="{lang key='search'}" autocomplete="off" aria=["label"=>"{lang key='search'}"]}
                    {inputgroupaddon append=true}
                        {button type="submit" variant="secondary" aria=["label"=>{lang key='search'}]}<span class="fas fa-search"></span>{/button}
                    {/inputgroupaddon}
                    <span class="form-clear d-none"><i class="fas fa-times"></i></span>
                {/inputgroup}
            </div>
        </form>
    </div>
{/block}

{block name='layout-footer-copyright'}
    <div id="copyright">
        {* container nicht fluid *}
        {container fluid=false}
            {row}
                {assign var=isBrandFree value=JTL\Shop::isBrandfree()}
                {block name='layout-footer-copyright-copyright'}
                    {col}
                        {if !empty($meta_copyright)}
                            {$currentYear = $smarty.now|date_format:'%Y'}
                            <span class="icon-mr-2" itemprop="copyrightHolder">&copy; {$currentYear} | {$meta_copyright}</span>
                        {/if}
                        {if $Einstellungen.global.global_zaehler_anzeigen === 'Y'}
                            {lang key='counter'}: {$Besucherzaehler}
                        {/if}
                        {if !empty($Einstellungen.global.global_fusszeilehinweis)}
                            <span class="ml-2">{$Einstellungen.global.global_fusszeilehinweis}</span>
                        {/if}
                    {/col}
                {/block}
                {if !$isBrandFree}
                    {block name='layout-footer-copyright-brand'}
                        {col cols=12 md="auto" class="ml-auto-util{if $Einstellungen.template.theme.button_scroll_top === 'Y'} pr-md-8{/if}" id="system-credits"}
                            Powered by {link href="https://jtl-url.de/jtlshop" class="text-white text-decoration-underline" title="JTL-Shop" target="_blank" rel="noopener nofollow"}JTL-Shop{/link}
                        {/col}
                    {/block}
                {/if}
            {/row}
        {/container}
    </div>
{/block}