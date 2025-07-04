{extends file="../../NOVA/checkout/order_completed.tpl"}

{block name='checkout-order-completed' append}
    {* Google Analytics E-Commerce Tracking *}
    {strip}{literal}
        <script>
            window.dataLayer = window.dataLayer || [];
            window.dataLayer.push({
                'event': 'purchase',
                'ecommerce': {
                    'transaction_id': '{/literal}{$Bestellung->cBestellNr}{literal}',
                    'affiliation': '{/literal}{$Einstellungen.global.global_shopname}{literal}',
                    'value': '{/literal}{$Bestellung->fWarensummeNetto|round:2}{literal}',
                    'tax': '{/literal}{$Bestellung->fSteuern|round:2}{literal}',
                    'shipping': '{/literal}{$Bestellung->fVersandNetto}{literal}',
                    'currency': 'EUR',
                    'coupon': '',
                    'items': [
                        {/literal}{assign var="addItemCount" value=0}
                        {foreach name=Bestell item=order from=$Bestellung->Positionen}
                            {if $order->nPosTyp == 1}
                                {if $addItemCount > 0},{/if}{literal}
                                {
                                    'item_name': '{/literal}{$order->cName}{literal}',
                                    'item_id': '{/literal}{$order->cArtNr}{literal}',
                                    'price': '{/literal}{$order->fPreis|round:2}{literal}',
                                    'item_brand': '',
                                    'item_variant': '',
                                    'item_category': '',
                                    'item_category2': '',
                                    'item_category3': '',
                                    'item_category4': '',
                                    'item_variant': '',
                                    'quantity': {/literal}{$order->nAnzahl|replace:",":"."}{literal}
                                }
                                {/literal}{assign var="addItemCount" value=$addItemCount+1}
                            {/if}
                        {/foreach}{literal}
                    ]
                }
            });
        </script>
    {/literal}{/strip}
{/block}