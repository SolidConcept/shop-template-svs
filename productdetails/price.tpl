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

{block name='productdetails-price-detail-vat-info' append}
    <div class="fachhandelskonditionen">
        {if $smarty.session.kSprache == 1}
            <a href="/fachhandelskonditionen">Zu unseren Fachhandelskonditionen</a>
        {else}
            <a href="/specialist-trade-conditions">To our specialised trade conditions</a>
        {/if}
    </div>
{/block}

{* Nettopreis bei Staffel ergänzen *}
{block name='productdetails-price-detail-bulk-price'}
    <div class="bulk-prices">
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
    </div>{* /bulk-price *}
{/block}