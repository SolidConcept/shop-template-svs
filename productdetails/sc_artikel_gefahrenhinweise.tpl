{* GPSR *}
{if isset($gpsrData) && (count($gpsrData[$Artikel->kArtikel]['manufacturer']) > 0 || count($gpsrData[$Artikel->kArtikel]['responsibleperson']) > 0)}
	<div id="herstellerInformationen">
		<div class="attribut">
			<div class="card">
				<div class="card-header" aria-expanded="false" aria-controls="tab-herstellerinformationen" data-toggle="collapse" data-target="#tab-herstellerinformationen">
					{$langGPSRManufacturerLabel}
				</div>
				<div class="collapse" id="tab-herstellerinformationen" data-parent="#herstellerInformationen">
					<div class="card-body">
						{block name='gpsr'}
						{/block}
					</div>
				</div>
			</div> 
		</div>
	</div>
{/if}

{block name='sicherheitshinweise'}
	{assign var=sicherheitshinweis value=""}
	{if $smarty.session.kSprache == 1}
		{assign var=sicherheitshinweis value=$Artikel->FunktionsAttribute.sicherheitshinweis_de}
	{else}
		{assign var=sicherheitshinweis value=$Artikel->FunktionsAttribute.sicherheitshinweis_en}
	{/if}

	{if ($sicherheitshinweis|@strlen > 0) || ($Artikel->FunktionsAttribute.bild|@strlen > 0) || ($Artikel->FunktionsAttribute.link|@strlen > 0)}
		<div id="sicherheitshinweise">
			<div class="attribut">
				<div class="card">
					<div class="card-header" aria-expanded="false" aria-controls="tab-sicherheitshinweise" data-toggle="collapse" data-target="#tab-sicherheitshinweise">
						{lang key='sicherheitshinweise' section='custom'}
					</div>
					<div class="collapse" id="tab-sicherheitshinweise" data-parent="#sicherheitshinweise">
						<div class="card-body">
							{$sicherheitshinweis}

							{if $Artikel->FunktionsAttribute.bild|@strlen > 0}
								<figure>
									<img src="{$Artikel->FunktionsAttribute.bild}" alt="{$Artikel->FunktionsAttribute.bildname}" class="img-fluid">
								</figure>
							{/if}

							{if $Artikel->FunktionsAttribute.link|@strlen > 0}
								<a class="btn btn-outline-secondary" target="_blank" href="{$Artikel->FunktionsAttribute.link}">&raquo; {$Artikel->FunktionsAttribute.linktext}</a>
							{/if}
						</div>
					</div>
				</div> 
			</div>
		</div>
	{/if}
{/block}


{block name='gefahrenhinweise'}
	{* Sprachabhängige Texte *}
	{assign var=gefahrenhinweis value=""}
	{assign var=signalwortIntro value=""}
	{assign var=label_signalwort value=""}
	{assign var=label_hinweis value=""}
	{assign var=label_starkstrom value=""}
	{assign var=ariaExpanded value="false"}

	{assign var=labels value=[]}
	{if $smarty.session.kSprache == 1}
		{assign var=gefahrenhinweis value=$Artikel->FunktionsAttribute.gefahrenhinweis_de}
		{assign var=signalwortIntro value="Biozidprodukte vorsichtig verwenden.<br>Vor Gebrauch stets Etikett und Produktinformationen lesen.<br>"}
		{assign var=label_signalwort value="Signalwort:"}
		{assign var=label_hinweis value="Hinweis:"}
		{assign var=label_starkstrom value="Dieses Produkt benötigt für seinen ordnungsgemäßen Betrieb eine erhöhte Netzspannung und ist nicht mit einem zweipoligen Netzstecker ausgestattet. Die Installation nicht-steckerfertiger Geräte ist vom jeweiligen Netzbetreiber oder von einem eingetragenen Fachbetrieb vorzunehmen, der Ihnen auch bei der Einholung der ggf. notwendigen Zustimmung des jeweiligen Netzbetreibers für die Installation des Gerätes behilflich ist."}
		{assign var=labels value=[
			"explosionsgefaehrlich" => "Explosionsgefährlich",
			"entzuendlich" => "Leicht- / Hochentzündlich",
			"brandfoerdernd" => "Brandfördernd",
			"komprimiertegase" => "Komprimierte Gase",
			"aetzend" => "Ätzend",
			"giftig" => "Giftig / Sehr giftig",
			"gesundheitsgefaehrdend" => "Gesundheitsgefährdend",
			"reizend" => "Reizend",
			"spezifischezielorgantoxizitaet" => "Zielorgan-Toxizität",
			"gewaessergefaehrdend" => "Gewässergefährdend"
		]}
	{else}
		{assign var=gefahrenhinweis value=$Artikel->FunktionsAttribute.gefahrenhinweis_en}
		{assign var=signalwortIntro value="Use biocidal products with care.<br>Always read the label and product information before use.<br>"}
		{assign var=label_signalwort value="Signal word:"}
		{assign var=label_hinweis value="Notice:"}
		{assign var=label_starkstrom value="This product requires a higher mains voltage for proper operation and is not equipped with a two-pole plug. Installation of non-plug-in devices must be carried out by the respective network operator or a registered specialist company, who can also assist you in obtaining any necessary approvals."}
		{assign var=labels value=[
			"explosionsgefaehrlich" => "Explosive",
			"entzuendlich" => "Highly flammable",
			"brandfoerdernd" => "Oxidizing",
			"komprimiertegase" => "Compressed gases",
			"aetzend" => "Corrosive",
			"giftig" => "Toxic / Very toxic",
			"gesundheitsgefaehrdend" => "Health hazard",
			"reizend" => "Irritant",
			"spezifischezielorgantoxizitaet" => "Target organ toxicity",
			"gewaessergefaehrdend" => "Hazardous to the aquatic environment"
		]}
	{/if}

	{if $Artikel->FunktionsAttribute.signalwort|@strlen > 0}
		{assign var=ariaExpanded value="true"}
	{/if}

	{if 
		($Artikel->FunktionsAttribute.signalwort|@strlen > 0)
		|| ($Artikel->FunktionsAttribute.explosionsgefaehrlich == 1)
		|| ($Artikel->FunktionsAttribute.entzuendlich == 1)
		|| ($Artikel->FunktionsAttribute.brandfoerdernd == 1)
		|| ($Artikel->FunktionsAttribute.komprimiertegase == 1)
		|| ($Artikel->FunktionsAttribute.aetzend == 1)
		|| ($Artikel->FunktionsAttribute.giftig == 1)
		|| ($Artikel->FunktionsAttribute.gesundheitsgefaehrdend == 1)
		|| ($Artikel->FunktionsAttribute.reizend == 1)
		|| ($Artikel->FunktionsAttribute.spezifischezielorgantoxizitaet == 1)
		|| ($Artikel->FunktionsAttribute.gewaessergefaehrdend == 1)
		|| ($gefahrenhinweis|@strlen > 0)
		|| ($Artikel->FunktionsAttribute.starkstromgeraet == 1)
	}
		<div id="gefahrenhinweise">
			<div class="attribut" id="gefahrenhinweise">
				<div class="card">
					<div class="card-header" aria-expanded="{$ariaExpanded}" aria-controls="tab-gefahrenhinweise" data-toggle="collapse" data-target="#tab-gefahrenhinweise">
						<strong>{lang key='gefahrenhinweise' section='custom'}</strong>
					</div>
					<div class="collapse{if $ariaExpanded == 'true'} show{/if}" id="tab-gefahrenhinweise" data-parent="#gefahrenhinweise">
						<div class="card-body">
							<div class="gefahrenhinweis">
								{if $gefahrenhinweis|@strlen > 0}
									{$gefahrenhinweis}
								{/if}

								{if $Artikel->FunktionsAttribute.signalwort|@strlen > 0}
									<p class="alert alert-warning">
										<strong>{$signalwortIntro}</strong>
										{$label_signalwort} {$Artikel->FunktionsAttribute.signalwort}
									</p>
								{/if}

								<div class="row">
									{strip}
									<div class="col col-12 col-md-3">
										{foreach from=$labels key=attr item=label}
											{if $Artikel->FunktionsAttribute[$attr] == 1}
												<span class="pikto">
													<img src="/bilder/gefahrenpiktogramme/{$attr|replace:'ä':'ae'|replace:'ö':'oe'|replace:'ü':'ue'|replace:'ß':'ss'}.png" alt="{$label}">
													<br><span>{$label}</span>
												</span>
											{/if}
										{/foreach}
									</div>
									{/strip}
								</div>
							</div>

							{if $Artikel->FunktionsAttribute.starkstromgeraet == 1}
								<div class="alert alert-warning gefahrenhinweis">
									<strong>{$label_hinweis}</strong><br>
									<small>{$label_starkstrom}</small>
								</div>
							{/if}
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}
{/block}

