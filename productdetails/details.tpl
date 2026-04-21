{extends file="{$parent_template_path}/productdetails/details.tpl"}

{* {block name='productdetails-details-include-image' prepend}
    {col cols=12}
    <h1 class="product-title h2 d-block d-md-none" itemprop="name">{$Artikel->cName}</h1>
    {/col}
{/block} *}

{block name='productdetails-details-info-product-title'}
    {opcMountPoint id='opc_before_headline'}
    {* <h1 class="product-title h2 d-none d-md-block" itemprop="name">{$Artikel->cName}</h1> *}
    <h1 class="product-title h2" itemprop="name">{$Artikel->cName}</h1>
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
{block name='productdetails-details-stock'}
  {* verschoben in productdetails-details-info *}
{/block}

   
{block name='productdetails-details-info' append}
    {* Fachhandelskonditionen + Versand außerhalb DE *}
    {* <div class="extraInfos">
        {row}
            {col cols=12}
                <div class="versandNichtDe">
                    {if $smarty.session.kSprache == 1}
                        <a href="/lieferungen-ausserhalb-deutschlands"><i class="fas fa-box"></i> <strong>Information zu Lieferungen außerhalb Deutschlands</strong> <i class="fas fa-arrow-right"></i></a>
                    {else}
                        <a href="/shipping-outside-germany"><i class="fas fa-box"></i> <strong>Information on deliveries outside Germany</strong> <i class="fas fa-arrow-right"></i></a>
                    {/if}
                </div>
            {/col}
        {/row}
    </div> *}

    <div class="extraInfos">
        {row}
            {col cols=12}
                <div class="stock-information {if !isset($availability) && !isset($shippingTime)}stock-information-p{/if}">
                    {block name='productdetails-details-include-stock'}
                        {include file='productdetails/stock.tpl'}
                    {/block}
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
                </div>
            {/col}
            {* USPS *}
            {col cols=12}
                {include file='snippets/sc_usps.tpl'}
            {/col}
            {* Zahlungsarten *}
            {col cols=12}
                {include file='snippets/sc_zahlungsarten.tpl'}
                <div class="fachhandelskonditionen">
                    {if $smarty.session.kSprache == 1}
                        <a href="/fachhandelskonditionen" class="btn"><i class="fas fa-store"></i><strong>Zu unseren Fachhandelskonditionen</strong></a>
                    {else}
                        <a href="/specialist-trade-conditions" class="btn"><i class="fas fa-store"></i> <strong>To our specialised trade conditions</strong></a>
                    {/if}
                </div>
            {/col}
        {/row}
    </div>

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
    {* Verschoben nach tabs.tpl (rechte Spalte, Cards) *}
{/block}