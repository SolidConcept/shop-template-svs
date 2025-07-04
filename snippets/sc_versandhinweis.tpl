{if $smarty.session.kSprache == 1}
    <div class="alert alert-warning versandhinweis">
        {* <p>Bei Käufen aus <strong>Nicht-EU-Ländern</strong>, wenden sie sich bitte <strong>direkt an unseren</strong> <a href="/kontakt"><strong>Kundenservice</strong></a></p> *}
        <p>Für Bestellungen <strong>außerhalb unseres Liefergebiets</strong>, wenden sie sich bitte <strong>direkt an unseren</strong> <a href="/kontakt"><strong>Kundenservice</strong></a></p>
    </div>
{else}
    <div class="alert alert-warning versandhinweis">
        {* <p>For purchases from <strong>Non-EU countries</strong>, please <strong>contact our <a href="/en/contact">customer service</a></strong>  directly</p> *}
        <p>For orders <strong>outside our delivery area</strong>, please contact our <strong><a href="/kontakt">customer service</a></strong> directly.</p>
    </div>
{/if}