{extends file="{$parent_template_path}/productlist/item_box.tpl"}

{* Kurzbeschreibung, Artikelnummer, GTIN eingefügt *}
{block name='productlist-item-box-caption-short-desc' append}
    <div class="productbox-infos">
        
        {if $Artikel->cArtNr != ''}
            <div class="product-sku">
                {lang key='sortProductno'}:
                <span itemprop="sku">{$Artikel->cArtNr}</span>
            </div>
        {/if}
        <div class="shortDesc">
            {$Artikel->cKurzBeschreibung}
        </div>
    </div>
{/block}

{* Wrapper um Produktangaben *}
{block name='productlist-index-include-price'}
    <div class="lastWrapper">
        <div itemprop="offers" itemscope itemtype="https://schema.org/Offer">
            <link itemprop="businessFunction" href="http://purl.org/goodrelations/v1#Sell" />
            {include file='productdetails/price.tpl' Artikel=$Artikel tplscope=$tplscope}
        </div>
        {* Verfügbarkeitsinformationen eingefügt *}
        {include file='productdetails/stock.tpl'}
        {* Zusätzlicher Button zum Produkt eingefügt *}
        <a href="{$Artikel->cURLFull}" class="btn">zum Artikel</a>
    </div>
{/block}