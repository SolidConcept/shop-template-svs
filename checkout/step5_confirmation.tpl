{extends file="{$parent_template_path}/checkout/step5_confirmation.tpl"}

{block name='checkout-step5-confirmation-shipping-method'}
    <p><strong class="title">{lang key='shippingOptions'}</strong></p>
    <p>{$smarty.session.Versandart->angezeigterName|trans}</p>

    {$cEstimatedDelivery = JTL\Session\Frontend::getCart()->getEstimatedDeliveryTime()}
    {if $cEstimatedDelivery|strlen > 0}
        <p class="small text-muted-util">
            {if $smarty.session.Versandart->angezeigterName|trans == "Angebotsanfrage"}
                <strong>{lang key='requestTime' section='custom'}</strong>: {$cEstimatedDelivery} TESTESTTS   
            {else}
                <strong>{lang key='shippingTime'}</strong>: {$cEstimatedDelivery}
            {/if}
        </p>
    {/if}
{/block}

{block name='checkout-step5-confirmation-order-items-actions'}
    {row class="checkout-button-row"}
        {col cols=12 md=6 lg=4 class='ml-auto-util order-1 order-md-2'}
            {button type="submit" variant="primary" id="complete-order-button" block=true class="submit_once button-row-mb"}
                {if $smarty.session.Versandart->angezeigterName|trans == "Angebotsanfrage"}
                    {lang key='buttonRequestTime' section='custom'}
                {else}
                    {lang key='orderLiableToPay' section='checkout'}
                {/if}
            {/button}
        {/col}
        {col cols=12 md=6 lg=3 class='order-2 order-md-1'}
            {link href="{get_static_route id='warenkorb.php'}" class="btn btn-outline-primary btn-block"}
                {lang key='modifyBasket' section='checkout'}
            {/link}
        {/col}
    {/row}
{/block}