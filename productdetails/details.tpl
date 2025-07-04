{extends file="{$parent_template_path}/productdetails/details.tpl"}

{block name='productdetails-details-include-image' prepend}
    {col cols=12}
    <h1 class="product-title h2 d-block d-md-none" itemprop="name">{$Artikel->cName}</h1>
    {/col}
{/block}
{block name='productdetails-details-info-product-title'}
    {opcMountPoint id='opc_before_headline'}
    <h1 class="product-title h2 d-none d-md-block" itemprop="name">{$Artikel->cName}</h1>
{/block}

{* Individuelle Kategorie-Links *}
{block name='productdetails-details-info-category'}
    <li class="product-category word-break">
        <strong>{lang key='category'}: </strong>
        {if isset($Artikel->AttributeAssoc.kategorie_text) && isset($Artikel->AttributeAssoc.kategorie_link)}
            <a href="{$Artikel->AttributeAssoc.kategorie_link}" itemprop="category"
            {if !empty($smarty.get.quickView)}target="_blank"{/if}
            >
                {$Artikel->AttributeAssoc.kategorie_text}
            </a>
        {else}
            <a href="{$Brotnavi[$cidx]->getURLFull()}" itemprop="category"
            {if !empty($smarty.get.quickView)}target="_blank"{/if}
            >
                {$Brotnavi[$cidx]->getName()}
            </a>
        {/if}
    </li>
{/block}

{* breite von col=12 zu col=5  *}
{* {block name='productdetails-details-stock'}
    {col cols=5}
        {row no-gutters=true class="stock-information {if !isset($availability) && !isset($shippingTime)}stock-information-p{/if}"}
            {col}
                {block name='productdetails-details-include-stock'}
                    {include file='productdetails/stock.tpl'}
                {/block}
            {/col}
            {col class="question-on-item col-auto"}
                {block name='productdetails-details-question-on-item'}
                    {if $Einstellungen.artikeldetails.artikeldetails_fragezumprodukt_anzeigen === 'P'}
                        <button type="button" id="z{$Artikel->kArtikel}"
                                class="btn btn-link question"
                                title="{lang key='productQuestion' section='productDetails'}"
                                data-toggle="modal"
                                data-target="#question-popup-{$Artikel->kArtikel}">
                            <span class="fa fa-question-circle"></span>
                            <span class="hidden-xs hidden-sm">{lang key='productQuestion' section='productDetails'}</span>
                        </button>
                    {/if}
                {/block}
            {/col}
        {/row}
        {block name='snippets-stock-note-include-warehouse'}
            {include file='productdetails/warehouse.tpl'}
        {/block}
    {/col}
{/block} *}

{block name='productdetails-details-info' append}
    {* USPS *}
    {include file='snippets/sc_usps.tpl'}

    {* Alert Kauf aus Nicht-EU-Ländern *}
    {include file='snippets/sc_versandhinweis.tpl'}
{/block}

{* Id für JumpingNav *}
{* {block name='productdetails-details-recommendations' prepend}
    {if isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0}
        <div id="passende"></div>
    {/if}
{/block} *}

{block name='productdetails-details-recommendations'}
    
    {* Id für JumpingNav *}
    {if isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0}
        <div id="passende"></div>
    {/if}

    {* Slider-Optionen *}
    {* {if isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0}
        {foreach $Xselling->Standard->XSellGruppen as $Gruppe}
            {include file='snippets/product_slider.tpl' class='x-supplies' id='slider-xsell-group-'|cat:$Gruppe@iteration productlist=$Gruppe->Artikel title=$Gruppe->Name
            slickOptions='{
                    "infinite": true,
                    "slidesToShow": 5,
                    "slidesToScroll": 5,
                    "responsive": [
                        {
                            "breakpoint": 992,
                            "settings": {
                                "slidesToShow": 3,
                                "slidesToScroll": 3,
                                "infinite": true
                            }
                        },
                        {
                            "breakpoint": 768,
                            "settings": {
                                "slidesToShow": 2,
                                "slidesToScroll": 2,
                                "infinite": true
                            }
                        }
                    ]
                }'
            }
        {/foreach}
    {/if}

    {if isset($Xselling->Kauf->Artikel) && count($Xselling->Kauf->Artikel) > 0}
        {lang key='customerWhoBoughtXBoughtAlsoY' section='productDetails' assign='slidertitle'}
        {include file='snippets/product_slider.tpl' class='x-sell' id='slider-xsell' productlist=$Xselling->Kauf->Artikel title=$slidertitle
        slickOptions='{
            "infinite": true,
            "slidesToShow": 5,
            "slidesToScroll": 5,
            "responsive": [
                {
                    "breakpoint": 992,
                    "settings": {
                        "slidesToShow": 3,
                        "slidesToScroll": 3,
                        "infinite": true
                    }
                },
                {
                    "breakpoint": 768,
                    "settings": {
                        "slidesToShow": 2,
                        "slidesToScroll": 2,
                        "infinite": true
                    }
                }
            ]
        }'
        }
    {/if}

    {if isset($oAehnlicheArtikel_arr) && count($oAehnlicheArtikel_arr) > 0}
        {lang key='RelatedProducts' section='productDetails' assign='slidertitle'}
        {include file='snippets/product_slider.tpl' class='x-related' id='slider-related' productlist=$oAehnlicheArtikel_arr title=$slidertitle
        slickOptions='{
            "infinite": true,
            "slidesToShow": 5,
            "slidesToScroll": 5,
            "responsive": [
                {
                    "breakpoint": 992,
                    "settings": {
                        "slidesToShow": 3,
                        "slidesToScroll": 3,
                        "infinite": true
                    }
                },
                {
                    "breakpoint": 768,
                    "settings": {
                        "slidesToShow": 2,
                        "slidesToScroll": 2,
                        "infinite": true
                    }
                }
            ]
        }'
        }
    {/if} *}

    {if isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0}
        {foreach $Xselling->Standard->XSellGruppen as $Gruppe}
            {include file='snippets/product_slider.tpl' class='x-supplies' id='slider-xsell-group-'|cat:$Gruppe@iteration productlist=$Gruppe->Artikel title=$Gruppe->Name}
        {/foreach}
    {/if}

    {if isset($Xselling->Kauf->Artikel) && count($Xselling->Kauf->Artikel) > 0}
        {lang key='customerWhoBoughtXBoughtAlsoY' section='productDetails' assign='slidertitle'}
        {include file='snippets/product_slider.tpl' class='x-sell' id='slider-xsell' productlist=$Xselling->Kauf->Artikel title=$slidertitle}
    {/if}

    {if isset($oAehnlicheArtikel_arr) && count($oAehnlicheArtikel_arr) > 0}
        {lang key='RelatedProducts' section='productDetails' assign='slidertitle'}
        {include file='snippets/product_slider.tpl' class='x-related' id='slider-related' productlist=$oAehnlicheArtikel_arr title=$slidertitle}
    {/if}
    
{/block}