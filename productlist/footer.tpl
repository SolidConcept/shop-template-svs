{extends file="{$parent_template_path}/productlist/footer.tpl"}

{block name='productlist-footer' prepend}
    {if $Einstellungen.navigationsfilter.kategorie_beschreibung_anzeigen === 'Y'
        && $oNavigationsinfo->getCategory() !== null
        && $oNavigationsinfo->getCategory()->getDescription()|strlen > 0}
        <div class="desc d-block d-sm-none mb-4">
            <p>{$oNavigationsinfo->getCategory()->getDescription()}</p>
        </div>
    {/if}
    {if $Einstellungen.navigationsfilter.hersteller_beschreibung_anzeigen === 'Y'
        && $oNavigationsinfo->getManufacturer() !== null
        && $oNavigationsinfo->getManufacturer()->getDescription()|strlen > 0}
        <div class="desc d-block d-sm-none mb-4">
            <p>{$oNavigationsinfo->getManufacturer()->getDescription()}</p>
        </div>
    {/if}
    {if $Einstellungen.navigationsfilter.merkmalwert_beschreibung_anzeigen === 'Y'
        && $oNavigationsinfo->getCharacteristicValue() !== null
        && $oNavigationsinfo->getCharacteristicValue()->getDescription()|strlen > 0}
        <div class="desc d-block d-sm-none mb-4">
            <p>{$oNavigationsinfo->getCharacteristicValue()->getDescription()}</p>
        </div>
    {/if}
{/block}
