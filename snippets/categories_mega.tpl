{extends file="{$parent_template_path}/snippets/categories_mega.tpl"}

{* Home als erster Menüpunkt *}
{block name='snippets-categories-mega' prepend}
    <li class="nav-item {if $Link && $Link->getID()==3} active{/if}">
        <a href="home_1" class="nav-link">Home</a>
    </li>
{/block}