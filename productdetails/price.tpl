{extends file="{$parent_template_path}/productdetails/price.tpl"}

{* Netto-Preis ergänzen *}
{block name='productdetails-price-label'}
    {if ($tplscope !== 'detail' && $Artikel->Preise->oPriceRange->isRange() && $Artikel->Preise->oPriceRange->rangeWidth() > $Einstellungen.artikeluebersicht.articleoverview_pricerange_width)
    || ($tplscope === 'detail' && ($Artikel->nVariationsAufpreisVorhanden == 1 || $Artikel->bHasKonfig) && $Artikel->kVaterArtikel == 0)}
        <span class="netto"><small>{lang key="priceStarting" section="global"}</small> <strong>{$Artikel->Preise->cVKLocalized[1]}</strong></span> 
        <span class="price_label pricestarting">{lang key='priceStarting'} </span>
    {elseif $Artikel->Preise->rabatt > 0}
        <span class="netto"><strong>{$Artikel->Preise->cVKLocalized[1]}</strong></span>  
        <span class="price_label nowonly">{lang key='nowOnly'} </span>
    {else}
        <span class="netto"><strong>{$Artikel->Preise->cVKLocalized[1]}</strong></span>  
    {/if}
{/block}

{* Brutto-Label ergänzen *}
{block name='productdetails-range'}
    <span{if $Artikel->Preise->oPriceRange->isRange() && $tplscope !== 'box'} itemprop="priceSpecification" itemscope itemtype="https://schema.org/UnitPriceSpecification"{/if}>
    {if $tplscope !== 'detail' && $Artikel->Preise->oPriceRange->isRange()}
        {* {if $Artikel->Preise->oPriceRange->rangeWidth() <= $Einstellungen.artikeluebersicht.articleoverview_pricerange_width}
            {assign var=rangePrices value=$Artikel->Preise->oPriceRange->getLocalizedArray($NettoPreise)}
            <span class="first-range-price">{$rangePrices[0]} - </span><span class="second-range-price">{$rangePrices[1]} {if $tplscope !== 'detail'} <span class="footnote-reference">*</span>{/if}</span>
        {else} *}
            {$Artikel->Preise->oPriceRange->getMinLocalized($NettoPreise)} <span class="footnote-reference">*</span>
        {* {/if} *}
    {else}
        {if $Artikel->Preise->oPriceRange->isRange() && ($Artikel->nVariationsAufpreisVorhanden == 1 || $Artikel->bHasKonfig) && $Artikel->kVaterArtikel == 0}
            {$Artikel->Preise->oPriceRange->getMinLocalized($NettoPreise)} <span class="label">Brutto</span>
        {else}
            {$Artikel->Preise->cVKLocalized[$NettoPreise]} <span class="label">Brutto</span>
        {/if}
    {/if}
    {if $tplscope !== 'detail' && !$Artikel->Preise->oPriceRange->isRange()} <span class="footnote-reference">*</span>{/if}
    </span>
{/block}
{* 
{block name='productdetails-price-detail-vat-info' append}
    <div class="fachhandelskonditionen">
        {if $smarty.session.kSprache == 1}
            <a href="/fachhandelskonditionen">Zu unseren Fachhandelskonditionen</a>
        {else}
            <a href="/specialist-trade-conditions">To our specialised trade conditions</a>
        {/if}
    </div>
{/block} *}


{block name='productdetails-price-detail-bulk-price'}
    {* Warenkorb Buttons *}
    {row class="basket-form-inline"}
        {$basketColWidth = 6}
        {if $Artikel->bHasKonfig}
            {$basketColWidth = 12}
        {/if}
        {if $Artikel->Preise->fVKNetto == 0 && isset($Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_VOUCHER_FLEX])}
            {col cols=12 sm=$basketColWidth}
                {inputgroup class="form-counter"}
                    {input type="number"
                        step=".01"
                        value="{if isset($voucherPrice)}{$voucherPrice}{/if}"
                        name="{$smarty.const.FKT_ATTRIBUT_VOUCHER_FLEX}Value"
                        required=true
                        placeholder="{lang key='voucherFlexPlaceholder' section='productDetails' printf=$smarty.session.Waehrung->getName()}"}
                    {inputgroupappend}
                        {inputgrouptext class="form-control"}
                            {JTL\Session\Frontend::getCurrency()->getName()}
                        {/inputgrouptext}
                    {/inputgroupappend}
                {/inputgroup}
            {/col}
            {input type="hidden" id="quantity" class="quantity" name="anzahl" value="1"}
        {else}
            {col cols=12 sm=$basketColWidth}
                {inputgroup id="quantity-grp" class="form-counter choose_quantity"}
                    {inputgroupprepend}
                        {button variant=""
                            data=["count-down"=>""]
                            aria=["label"=>{lang key='decreaseQuantity' section='aria'}]}
                            <span class="fas fa-minus"></span>
                        {/button}
                    {/inputgroupprepend}
                    {$step = 1}
                    {if $Artikel->cTeilbar === 'Y' && $interval == 0}
                        {$step = 'any'}
                    {elseif $interval > 0}
                        {$step = $interval}
                    {/if}
                    {$inputValue = 1}
                    {if $interval > 0 || $mbm > 1}
                        {$inputValue = max($mbm,$interval)}
                    {elseif isset($fAnzahl)}
                        {$inputValue = $fAnzahl}
                    {/if}
                    {$pid = $Artikel->kVariKindArtikel|default:$Artikel->kArtikel}
                    {input type="number"
                        min=$mbm
                        max=$Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_MAXBESTELLMENGE]|default:''
                        required=($interval > 0)
                        step=$step
                        id="quantity" class="quantity" name="anzahl"
                        aria=["label"=>"{lang key='quantity'}"]
                        value=$inputValue
                        data=[
                            "decimals"=>{getDecimalLength quantity=$interval},
                            "product-id"=>"{$pid}"
                        ]
                    }
                    {inputgroupappend}
                        {if $Artikel->cEinheit}
                            {inputgrouptext class="unit form-control"}
                                {$Artikel->cEinheit}
                            {/inputgrouptext}
                        {/if}
                        {button variant=""
                            data=["count-up"=>""]
                            aria=["label"=>{lang key='increaseQuantity' section='aria'}]}
                            <span class="fas fa-plus"></span>
                        {/button}
                    {/inputgroupappend}
                {/inputgroup}
            {/col}
            {col cols=12 sm=$basketColWidth}
                {button aria=["label"=>"{lang key='addToCart'}"]
                    block=true name="inWarenkorb"
                    type="submit"
                    value="{lang key='addToCart'}"
                    variant="primary"
                    disabled=$Artikel->bHasKonfig && !$isConfigCorrect|default:false
                    class="js-cfg-validate"}
                    <span class="btn-basket-check">
                        <span>
                            {if isset($kEditKonfig)}
                                {lang key='applyChanges'}
                            {else}
                                {lang key='addToCart'}
                            {/if}
                        </span> <i class="fas fa-shopping-cart"></i>
                    </span>
                    {* <svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
                        <path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
                    </svg> *}
                {/button}
                {if isset($kEditKonfig)}
                    <input type="hidden" name="kEditKonfig" value="{$kEditKonfig}"/>
                {/if}
            {/col}
        {/if}
    {/row}

    {* Nettopreis bei Staffel ergänzen *}
    <div class="bulk-prices card">
        <div class="card-header" data-toggle="collapse" data-target="#bulk-prices-table" aria-expanded="false" aria-controls="bulk-prices-table">
            <strong>Preistabelle</strong>
        </div>
        <div id="bulk-prices-table" class="collapse">
            <div class="card-body">
                <table class="table table-sm table-hover">
                    <thead>
                        {block name='productdetails-price-detail-bulk-price-head'}
                            <tr>
                                <th>
                                    {lang key='fromDifferential' section='productOverview'}
                                </th>
                                <th>{lang key='pricePerUnit' section='productDetails'}{if $Artikel->cEinheit} / {$Artikel->cEinheit}{/if}
                                    {if isset($Artikel->cMasseinheitName) && isset($Artikel->fMassMenge) && $Artikel->fMassMenge > 0 && $Artikel->cTeilbar !== 'Y' && ($Artikel->fAbnahmeintervall == 0 || $Artikel->fAbnahmeintervall == 1) && isset($Artikel->cMassMenge)}
                                        ({$Artikel->cMassMenge} {$Artikel->cMasseinheitName})
                                    {/if}
                                    <br>Netto
                                </th>
                                <th>{lang key='pricePerUnit' section='productDetails'}{if $Artikel->cEinheit} / {$Artikel->cEinheit}{/if}
                                    {if isset($Artikel->cMasseinheitName) && isset($Artikel->fMassMenge) && $Artikel->fMassMenge > 0 && $Artikel->cTeilbar !== 'Y' && ($Artikel->fAbnahmeintervall == 0 || $Artikel->fAbnahmeintervall == 1) && isset($Artikel->cMassMenge)}
                                        ({$Artikel->cMassMenge} {$Artikel->cMasseinheitName})
                                    {/if}
                                    <br>Brutto
                                </th>
                                {if !empty($Artikel->staffelPreis_arr[0].cBasePriceLocalized)}
                                <th>
                                    {lang key='basePrice'}<br>
                                </th>
                                {/if}
                            </tr>
                        {/block}
                    </thead>
                    <tbody>
                        {block name='productdetails-price-detail-bulk-price-body'}
                            {foreach $Artikel->staffelPreis_arr as $bulkPrice}
                                {if $bulkPrice.nAnzahl > 0}
                                    <tr class="bulk-price-{$bulkPrice.nAnzahl}">
                                        <td>{$bulkPrice.nAnzahl}</td>
                                        <td>
                                            <span class="bulk-price">{$bulkPrice.cPreisLocalized[1]}</span>
                                        </td>
                                        <td>
                                            <span class="bulk-price">{$bulkPrice.cPreisLocalized[$NettoPreise]}</span><span class="footnote-reference">*</span>
                                        </td>
                                        {if !empty($bulkPrice.cBasePriceLocalized)}
                                            <td class="bulk-base-price">
                                                {$bulkPrice.cBasePriceLocalized[$NettoPreise]}
                                            </td>
                                        {/if}
                                    </tr>
                                {/if}
                            {/foreach}
                        {/block}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
{/block}