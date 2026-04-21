{if $smarty.session.kSprache == 1}
    <div class="payment">
        <p>Sicher bezahlen mit:</p>
        <ul>
            <li><img src="mediafiles/Bilder/euro.png"> Vorkasse</li>
            <li><img src="mediafiles/Bilder/paypal.png"> PayPal</li>
            <li><img src="mediafiles/Bilder/paypal.png"> PayPal Plus</li>
        </ul>
    </div>
{else}
    <div class="payment">
        <p>Pay securely with:</p>
        <ul>
            <li><img src="mediafiles/Bilder/euro.png"> Prepayment</li>
            <li><img src="mediafiles/Bilder/paypal.png">PayPal</li>
            <li><img src="mediafiles/Bilder/paypal.png">PayPal Plus</li>
        </ul>
    </div>
{/if}