{extends file="{$parent_template_path}/layout/header_logo.tpl"}

{block name='layout-header-logo-logo' prepend}
    {if $smarty.session.kSprache == 1}
        {$ShopHomeURL = '/home'}
    {else}
        {$ShopHomeURL = '/home-en'}
    {/if}
{/block}