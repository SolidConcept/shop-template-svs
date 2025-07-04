{extends file="../../NOVA/checkout/inc_billing_address_form.tpl"}

{block name='checkout-inc-billing-address-form-company-wrap'}
    <div class="infoWrapper">
        {if $smarty.session.kSprache == 1}
            <legend>Optionale Angaben für Geschäftskunden</legend>
        {else}
            <legend>Optional information for business customers</legend>
        {/if}

        {row}
        {if $Einstellungen.kunden.kundenregistrierung_abfragen_firma !== 'N'}
            {col cols=12 md=6}
                {if isset($cPost_var['firma'])}
                    {assign var=inputVal_firm value=$cPost_var['firma']}
                {elseif isset($Kunde->cFirma)}
                    {assign var=inputVal_firm value=$Kunde->cFirma}
                {/if}
                {block name='checkout-inc-billing-address-form-company'}
                    {include file='snippets/form_group_simple.tpl'
                        options=[
                            'text', 'firm', 'firma',
                            {$inputVal_firm|default:null}, {lang key='firm' section='account data'},
                            $Einstellungen.kunden.kundenregistrierung_abfragen_firma, null, 'billing organization'
                        ]
                    }
                {/block}
            {/col}
        {/if}

        {if $Einstellungen.kunden.kundenregistrierung_abfragen_firmazusatz !== 'N'}
            {col cols=12 md=6}
                {if isset($cPost_var['firmazusatz'])}
                    {assign var=inputVal_firmext value=$cPost_var['firmazusatz']}
                {elseif isset($Kunde->cZusatz)}
                    {assign var=inputVal_firmext value=$Kunde->cZusatz}
                {/if}
                {block name='checkout-inc-billing-address-form-company-additional'}
                    {include file='snippets/form_group_simple.tpl'
                        options=[
                            'text', 'firmext', 'firmazusatz',
                            {$inputVal_firmext|default:null}, {lang key='firmext' section='account data'},
                            $Einstellungen.kunden.kundenregistrierung_abfragen_firmazusatz
                        ]
                    }
                {/block}
            {/col}
        {/if}

        {* UStID *}
        {if $Einstellungen.kunden.kundenregistrierung_abfragen_ustid !== 'N'}
            {* {block name='checkout-inc-billing-address-form-vat'} *}
                {* {col cols=12} *}
                {col cols=12 md=6}
                    {formgroup
                        class="{if isset($fehlendeAngaben.ustid)} has-error{/if}"
                        label-for="ustid"
                        label="{lang key='ustid' section='account data'}{if $Einstellungen.kunden.kundenregistrierung_abfragen_ustid !== 'Y'}<span class='optional'> - {lang key='optional'}</span>{/if}"
                    }
                        {if isset($fehlendeAngaben.ustid)}
                            <div class="form-error-msg"><i class="fas fa-exclamation-triangle"></i>
                                {if $fehlendeAngaben.ustid == 1}
                                    {lang key='fillOut' section='global'}
                                {elseif $fehlendeAngaben.ustid == 2}
                                    {assign var=errorinfo value=","|explode:$fehlendeAngaben.ustid_err}
                                    {if $errorinfo[0] == 100}{lang key='ustIDError100' section='global'}{/if}
                                    {if $errorinfo[0] == 110}{lang key='ustIDError110' section='global'}{/if}
                                    {if $errorinfo[0] == 120}{lang key='ustIDError120' section='global'}{$errorinfo[1]}{/if}
                                    {if $errorinfo[0] == 130}{lang key='ustIDError130' section='global'}{$errorinfo[1]}{/if}
                                {elseif $fehlendeAngaben.ustid == 4}
                                    {assign var=errorinfo value=","|explode:$fehlendeAngaben.ustid_err}
                                    {lang key='ustIDError200' section='global'}{$errorinfo[1]}
                                {elseif $fehlendeAngaben.ustid == 5}
                                    {lang key='ustIDCaseFive' section='global'}
                                {/if}
                            </div>
                        {/if}
                        {input
                            type="text"
                            name="ustid"
                            value="{if isset($cPost_var['ustid'])}{$cPost_var['ustid']}{elseif isset($Kunde->cUSTID)}{$Kunde->cUSTID}{/if}"
                            id="ustid"
                            placeholder=" "
                            required=($Einstellungen.kunden.kundenregistrierung_abfragen_ustid === 'Y')
                        }
                    {/formgroup}
                {/col}
            {* {/block} *}
        {/if}

        {/row}

        <p class="info">
            {if $smarty.session.kSprache == 1}
                Als Fachhändler und Wiederverkäufer erhalten Sie besondere Konditionen und Angebote.<br>
                Informieren Sie sich noch <strong>vor</strong> Ihrer Bestellung <a href="/fachhandelskonditionen">zu unseren Fachhandelskonditionen</a>.
            {else}
                As a specialist dealer and reseller, you will receive special conditions and offers.<br>
                Inform yourself about <a href="/specialist-trade-conditions">our specialist trade conditions</a> before placing your order.
            {/if}
        </p>
        <div class="w-100-util"></div>
    </div>
{/block}


{block name='checkout-inc-billing-address-form-vat'}
    {* Verschoben in checkout-inc-billing-address-form-company-wrap *}
{/block}