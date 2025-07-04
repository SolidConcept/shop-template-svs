{extends file="{$parent_template_path}/basket/cart_dropdown.tpl"}

{block name='basket-cart-dropdown-cart-items-content' prepend}
    <div class="dropdown-body">
        <ul class="list-unstyled">
            {* Zwischensummme über Ust. *}
            {block name='basket-cart-dropdown-cart-item-total'}
                <li class="font-weight-bold-util">
                    {if empty($smarty.session.Versandart)}
                        {lang key='subtotal' section='account data'}
                    {else}
                        {lang key='totalSum'}
                    {/if}: <span class="cart-dropdown-total-item-price">{$WarensummeLocalized[0]}</span>
                </li>
            {/block}

            {if $NettoPreise}
                {block name='basket-cart-dropdown-cart-item-net'}
                    <li class="cart-dropdown-total-item">
                        {if empty($smarty.session.Versandart)}
                            {lang key='subtotal' section='account data'}
                        {else}
                            {lang key='totalSum'}
                        {/if} ({lang key='net'}) <span class="cart-dropdown-total-item-price">{$WarensummeLocalized[$NettoPreise]}</span>
                    </li>
                {/block}
            {/if}
            {if $Einstellungen.global.global_steuerpos_anzeigen !== 'N' && isset($Steuerpositionen) && $Steuerpositionen|count > 0}
                {block name='basket-cart-dropdown-cart-item-tax'}
                    {foreach $Steuerpositionen as $Steuerposition}
                        <li class="cart-dropdown-total-item">
                            {$Steuerposition->cName}
                            <span class="cart-dropdown-total-item-price">{$Steuerposition->cPreisLocalized}</span>
                        </li>
                    {/foreach}
                {/block}
            {/if}
   
            {block name='basket-cart-dropdown-cart-item-favourable-shipping'}
                {if $favourableShippingString !== ''}
                    <li class="cart-dropdown-total-item">{$favourableShippingString}</li>
                {/if}
            {/block}
        </ul>
        {row class="cart-dropdown-buttons"}
            {* {col cols=12 lg=6}
                {button variant="outline-primary" type="link" block=true  size="sm" href="{get_static_route id='bestellvorgang.php'}?wk=1" class="cart-dropdown-next"}
                    {lang key='nextStepCheckout' section='checkout'}
                {/button}
            {/col}
            {col cols=12 lg=6}
                {button variant="primary" type="link" block=true  size="sm" title="{lang key='gotoBasket'}" href="{get_static_route id='warenkorb.php'}"}
                    {lang key='gotoBasket'}
                {/button}
            {/col} *}
            {* Kauf nicht möglich -> Zur Kasse Button ausblenden *}
            {col cols=12 lg=12}
                {button variant="primary" type="link" block=true  size="sm" title="{lang key='gotoBasket'}" href="{get_static_route id='warenkorb.php'}"}
                    {lang key='gotoBasket'}
                {/button}
            {/col}
        {/row}
        {if !empty($WarenkorbVersandkostenfreiHinweis)}
            {block name='basket-cart-dropdown-shipping-free-hint'}
                <hr>
                <ul class="cart-dropdown-shipping-notice list-icons font-size-sm">
                    <li>
                        <a class="popup"
                            href="{if !empty($oSpezialseiten_arr) && isset($oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND])}{$oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND]->getURL()}{else}#{/if}"
                            data-toggle="tooltip"
                            data-placement="bottom"
                            title="{lang key='shippingInfo' section='login'}">
                            <i class="fa fa-info-circle"></i>
                        </a>
                        {$WarenkorbVersandkostenfreiHinweis|truncate:160:"..."}
                    </li>
                </ul>
            {/block}
        {/if}
    </div>
{/block}

{block name='basket-cart-dropdown-total'}
   {* verschoben in 'basket-cart-dropdown-cart-items-content' *}
{/block}

{block name='basket-cart-dropdown-buttons'}
    {* verschoben in 'basket-cart-dropdown-cart-items-content' *}
{/block}
