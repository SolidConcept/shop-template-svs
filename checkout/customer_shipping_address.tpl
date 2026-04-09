{extends file="{$parent_template_path}/checkout/customer_shipping_address.tpl"}

{block name='checkout-customer-shipping-address-country' append}
    <div class="alert alert-warning versandAusland">
        <i class="fas fa-info"></i>
        {if $smarty.session.kSprache == 1}
            <p><strong>Versand nur innerhalb Deutschlands verfügbar</strong><br>
                <a href="/lieferungen-ausserhalb-deutschlands">Details zu internationalen Lieferungen erhalten Sie <strong>hier</strong></a>
            </p>
        {else}
           <p><strong>Shipping only available within Germany</strong><br>
                <a href="/shipping-outside-germany">You can find details about international deliveries <strong>here</strong></a>
            </p>
        {/if}
    </div>
{/block} 