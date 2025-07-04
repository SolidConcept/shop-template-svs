{extends file="{$parent_template_path}/basket/index.tpl"}

 {block name='basket-index-heading' append}

    {* Alert Kauf aus Nicht-EU-Ländern *}
    {if ($Warenkorb->PositionenArr|@count > 0)}
        {include file='snippets/sc_versandhinweis.tpl'}
    {/if}
{/block}

{* {block name='basket-index-side'} *}
    {* Kauf nicht möglich -> Info zu Kauf auf Anfrage *}
    {* {col class='ml-auto-util' cols=12 lg=5}
        {if $smarty.session.kSprache == 1}
            <div class="alert alert-warning left">
                <h2>Information zum aktuellen Verkauf</h2>
                <p><strong>Bitte wenden Sie sich vor einer Bestellung per Email an uns.</strong><br>
                Bei Fragen erreichen Sie uns gerne auch telefonisch.</p>
                <p> Tel.: +49 (0)7124 9286 0<br>
                Fax.: +49 (0)7124 9286 42<br>
                E-Mail: <a href="mailto:home@svs-funk.com">home@svs-funk.com</a></p>
                <a class="btn btn-primary" href="kontakt">Zum Kontaktformular</a>
            </div>
        {else}
            <div class="alert alert-warning left">
                <h2>Information on the current sale</h2>
                <p><strong>Please contact us by email before placing an order.</strong><br>If you have any questions, you can also contact us by telephone.</p>
                <p> Phone: +49 (0)7124 9286 0<br>
                Fax: +49 (0)7124 9286 42<br>
                E-Mail: <a href="mailto:home@svs-funk.com">home@svs-funk.com</a></p>
                <a class="btn btn-primary" href="kontakt">Contact form</a>
            </div>
        {/if}
    {/col}
{/block} *}