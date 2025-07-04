{extends file="{$parent_template_path}/productlist/header.tpl"}

{block name='productlist-header' prepend}
    {* Link zurück zur Überkategorie *}
    {assign var=i_site value=$Brotnavi|count}{assign var=i_kat value=$i_site-2}
    {if $Brotnavi[$i_kat]->name != 'Startseite'}
        <div class="row d-lg-none">
            <div class="col col-12 mb-4">
                <a href="{$Brotnavi[$i_kat]->url}" class="btn btn-outline-secondary small linkBack">&laquo; Zur&uuml;ck zu {$Brotnavi[$i_kat]->name}</a>
            </div>
        </div>
    {/if}
{/block}

{block name='productlist-header-description-heading'}
    <h1>
        {if !empty($meta_title)} 
            {$meta_title}
        {else}
            {$oNavigationsinfo->getName()}
        {/if} 
    </h1>
{/block}

{* Beschreibung ausblenden  *}
{block name='productlist-header-description-category'}
    <div class="desc d-none d-sm-block">
        <p>{$oNavigationsinfo->getCategory()->getDescription()}</p>
    </div>
{/block}
{block name='productlist-header-description-manufacturers'}
    <div class="desc d-none d-sm-block">
        <p>{$oNavigationsinfo->getManufacturer()->getDescription()}</p>
    </div>
{/block}
{block name='productlist-header-description-attributes'}
    <div class="desc d-none d-sm-block">
        <p>{$oNavigationsinfo->getCharacteristicValue()->getDescription()}</p>
    </div>
{/block}


{block name='productlist-header-subcategories' prepend}
    {opcMountPoint id='opc_subcategories_description'}

    {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'N' && $oUnterKategorien_arr|count > 0}
        <div class="catHeadline">Unterkategorien von {$oNavigationsinfo->getName()}:</div>
    {/if}
{/block}

{* Sub-Categories Kacheln entfernt *}
{* {block name='productlist-header-subcategories'}
{/block} *}