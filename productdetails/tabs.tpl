{extends file="{$parent_template_path}/productdetails/tabs.tpl"}

{* jumpingNav ergänzt *}
{* {block name='productdetails-tabs-content' prepend}
  <div class="jumpingNav">
    <ul>
      <li class="active">
        <a href="{$Artikel->cURLFull}#desc" class="scrollTo">{lang key="description" section="productDetails"}</a>
      </li>
      <li>
        <a href="{$Artikel->cURLFull}#technische-daten" class="scrollTo">{lang key="technische-daten" section="global"}</a>
      </li>
      <li class="downloads">
        <a href="{$Artikel->cURLFull}#downloads" class="scrollTo">{lang key="downloads" section="global"}</a>
      </li>
      <li class="vergleich">
        <a href="{$Artikel->cURLFull}#vergleich" class="scrollTo">{lang key="vergleich" section="custom"}</a>
      </li>
      <li class="anwendungen">
        <a href="{$Artikel->cURLFull}#anwendungen" class="scrollTo">{lang key="anwendungen" section="custom"}</a>
      </li>
      <li class="passende">
        <a href="{$Artikel->cURLFull}#passende" class="scrollTo">{lang key="passende" section="global"}</a>
      </li>
    </ul>
  </div>
{/block} *}

{block name='productdetails-tabs-no-tabs'}
    {container class="{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
        <div class="row">
            <div class="col-12 col-md-6">
                {if $useDescription}
                    {block name='productdetails-tabs-description'}
                        <h2 class="h3">{lang key='description' section='productDetails'}</h2>
                        {block name='productdetails-tabs-card-description'}
                            {block name='productdetails-tabs-card-description-content'}
                                {opcMountPoint id='opc_before_desc'}
                                <div class="desc" id="desc">
                                    {$Artikel->cBeschreibung}
                                    {if $useDescriptionWithMediaGroup}
                                        {if $Artikel->cBeschreibung|strlen > 0}
                                            <hr>
                                        {/if}
                                        {foreach $Artikel->getMediaTypes() as $mediaType}
                                            <div class="media">
                                                {block name='productdetails-tabs-description-include-mediafile'}
                                                    {include file='productdetails/mediafile.tpl'}
                                                {/block}
                                            </div>
                                        {/foreach}
                                    {/if}
                                </div>
                                {opcMountPoint id='opc_after_desc'}
                            {/block}
                        {/block}
                    {/block}
                {/if}
            </div>

            {* Rechte Spalte: Cards *}
            <div class="col-12 col-md-6 cardList">
              {* Technische Daten *}
                {card no-body=true}
                    {cardheader id="tab-technische-daten-head"
                        data=["toggle" => "collapse",
                            "target" => "#tab-technische-daten-content"
                        ]
                        aria=["expanded" => "true",
                            "controls" => "tab-technische-daten-content"
                        ]
                        }
                        <span id="technische-daten">{lang key="technische-daten" section="global"}</span>
                    {/cardheader}
                    {collapse id="tab-technische-daten-content"|cat:$quickViewIdPostfix visible=true}
                        {cardbody}
                            {block name='productdetails-tabs-card-description-attributes'}
                                {block name='productdetails-tabs-include-attributes'}
                                    {include file='productdetails/attributes.tpl' tplscope='details'
                                    showProductWeight=$showProductWeight showShippingWeight=$showShippingWeight
                                    dimension=$dimension showAttributesTable=$showAttributesTable}
                                {/block}
                            {/block}
                        {/cardbody}
                    {/collapse}
                {/card}

                {include file="productdetails/sc_artikel_gefahrenhinweise.tpl"}

                {* Downloads *}
                {if $useMediaGroup}
                    {block name='productdetails-tabs-media-gorup'}
                        {foreach $Artikel->getMediaTypes() as $mediaType}
                            {$cMedienTypId = $mediaType->name|seofy}
                            {card no-body=true}
                                {cardheader id="tab-{$cMedienTypId}-head"
                                    data=["toggle" => "collapse",
                                        "target" => "#tab-{$cMedienTypId}"
                                    ]
                                    aria=["expanded" => "{if $setActiveClass.mediaGroup && $mediaType@first}true{else}false{/if}",
                                        "controls" => "tab-{$cMedienTypId}"
                                    ]
                                }
                                Downloads
                                {/cardheader}
                                {collapse id="tab-{$cMedienTypId}"|cat:$quickViewIdPostfix
                                    visible=($setActiveClass.mediaGroup && $mediaType@first)
                                }
                                {cardbody}
                                    {block name='productdetails-tabs-include-mediafile'}
                                        <div id="downloads">{include file='productdetails/mediafile.tpl'}</div>
                                    {/block}
                                {/cardbody}
                                {/collapse}
                            {/card}
                        {/foreach}
                        {* <div class="innerWrapper">{opcMountPoint id='opc_download'}</div> *}
                    {/block}
                {/if}

              {* Einsatzgebiete*}
                <div id="anwendungen">
                    {card no-body=true}
                        {cardheader id="tab-anwendungen-head"
                            data=["toggle" => "collapse",
                                "target" => "#tab-anwendungen-content"
                            ]
                            aria=["expanded" => "false",
                                "controls" => "tab-anwendungen-content"
                            ]
                        }
                        Anwendungen
                        {/cardheader}
                        {collapse id="tab-anwendungen-content"|cat:$quickViewIdPostfix visible=false}
                            {cardbody}
                            <div class="innerWrapper">{opcMountPoint id='opc_anwendungen'}</div>
                            {/cardbody}
                        {/collapse}
                    {/card}
                </div>
              {* Passende Produkte / Zubehör: XSell-Gruppen aus details.tpl *}
                {if isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0}
                    {foreach $Xselling->Standard->XSellGruppen as $Gruppe}
                        {$xsellCardId = 'tab-xsell-'|cat:$Gruppe@iteration}
                        {card no-body=true}
                            {cardheader id="{$xsellCardId}-head"
                                data=["toggle" => "collapse",
                                    "target" => "#{$xsellCardId}-content"
                                ]
                                aria=["expanded" => "false",
                                    "controls" => "{$xsellCardId}-content"
                                ]
                            }
                            {$Gruppe->Name}
                            {/cardheader}
                            {collapse id="{$xsellCardId}-content"|cat:$quickViewIdPostfix visible=false}
                                {cardbody}
                                    <div class="recommendations">
                                        {include file='snippets/product_slider.tpl'
                                            class='x-supplies'
                                            id='slider-xsell-group-'|cat:$Gruppe@iteration
                                            productlist=$Gruppe->Artikel
                                            title=$Gruppe->Name}
                                    </div>
                                {/cardbody}
                            {/collapse}
                        {/card}
                    {/foreach}
                {/if}

              {* Kunden kauften auch *}
              {if isset($Xselling->Kauf->Artikel) && count($Xselling->Kauf->Artikel) > 0}
                  {lang key='customerWhoBoughtXBoughtAlsoY' section='productDetails' assign='kauftitel'}
                  {card no-body=true}
                      {cardheader id="tab-xsell-kauf-head"
                          data=["toggle" => "collapse",
                              "target" => "#tab-xsell-kauf-content"
                          ]
                          aria=["expanded" => "false",
                              "controls" => "tab-xsell-kauf-content"
                          ]
                      }
                          {$kauftitel}
                      {/cardheader}
                      {collapse id="tab-xsell-kauf-content"|cat:$quickViewIdPostfix visible=false}
                          {cardbody}
                              {include file='snippets/product_slider.tpl'
                                  class='x-sell'
                                  id='slider-xsell'
                                  productlist=$Xselling->Kauf->Artikel
                                  title=$kauftitel}
                          {/cardbody}
                      {/collapse}
                  {/card}
              {/if}

              {* Ähnliche Artikel *}
              {if isset($oAehnlicheArtikel_arr) && count($oAehnlicheArtikel_arr) > 0}
                  {lang key='RelatedProducts' section='productDetails' assign='aehnlichtitel'}
                  {card no-body=true}
                      {cardheader id="tab-related-head"
                          data=["toggle" => "collapse",
                              "target" => "#tab-related-content"
                          ]
                          aria=["expanded" => "false",
                              "controls" => "tab-related-content"
                          ]
                      }
                          {$aehnlichtitel}
                      {/cardheader}
                      {collapse id="tab-related-content"|cat:$quickViewIdPostfix visible=false}
                          {cardbody}
                              {include file='snippets/product_slider.tpl'
                                  class='x-related'
                                  id='slider-related'
                                  productlist=$oAehnlicheArtikel_arr
                                  title=$aehnlichtitel}
                          {/cardbody}
                      {/collapse}
                  {/card}
              {/if}
            </div>
        </div>

        {* Info-Banner ergänzt *}
        {include file="snippets/sc_info_banner.tpl"}

          {if !empty($separatedTabs)}
              {block name='productdetails-tabs-separated-tabs'}
                  {foreach $separatedTabs as $separatedTab}
                      {$separatedTabId = $separatedTab.name|seofy}
                      {* {card no-body=true}
                          {cardheader id="tab-{$separatedTabId}-head"
                              data=["toggle" => "collapse",
                                  "target"=>"#tab-{$separatedTabId}"
                              ]
                              aria=["expanded" => "{if $setActiveClass.separatedTabs && $separatedTab@first}true{else}false{/if}",
                                  "controls" => "tab-{$separatedTabId}"
                              ]
                          } *}
                              {$separatedTab.name}
                          {* {/cardheader} *}
                          {collapse id="tab-{$separatedTabId}"|cat:$quickViewIdPostfix
                                visible=($setActiveClass.separatedTabs && $separatedTab@first)
                                data=["parent"=>"#tabAccordion"|cat:$quickViewIdPostfix]
                                aria=["labelledby"=>"tab-{$separatedTabId}-head"|cat:$quickViewIdPostfix]
                            }
                              {* {cardbody} *}
                                  {opcMountPoint id='opc_before_separated_'|cat:$separatedTab.id}
                                  {$separatedTab.content}
                                  {opcMountPoint id='opc_after_separated_'|cat:$separatedTab.id}
                              {* {/cardbody} *}
                          {/collapse}
                      {* {/card} *}
                  {/foreach}
              {/block}
          {/if}

          {if $useVotes}
              {block name='productdetails-tabs-votes'}
                  {* {card no-body=true }
                      {cardheader id="tab-votes-head"
                          data=["toggle" => "collapse",
                              "target"=>"#tab-votes"
                          ]
                          aria=["expanded" => "{if $setActiveClass.votes}true{else}false{/if}",
                              "controls" => "tab-votes"
                          ]
                      } *}
                          {lang key='Votes'}
                      {* {/cardheader} *}
                      {collapse id="tab-votes"|cat:$quickViewIdPostfix visible=$setActiveClass.votes
                            data=["parent"=>"#tabAccordion"|cat:$quickViewIdPostfix]
                            aria=["labelledby"=>"tab-votes-head"|cat:$quickViewIdPostfix]
                        }
                          {* {cardbody} *}
                              {block name='productdetails-tabs-include-reviews'}
                                  {opcMountPoint id='opc_before_tab_votes'}
                                  {include file='productdetails/reviews.tpl' stars=$Artikel->Bewertungen->oBewertungGesamt->fDurchschnitt}
                                  {opcMountPoint id='opc_after_tab_votes'}
                              {/block}
                          {* {/cardbody} *}
                      {/collapse}
                  {* {/card} *}
              {/block}
          {/if}

          {if $useQuestionOnItem}
              {block name='productdetails-tabs-question-on-item'}
                  {* {card no-body=true}
                      {cardheader id="tab-question-head"
                          data=["toggle" => "collapse",
                              "target"=>"#tab-questionOnItem"
                          ]
                          aria=["expanded" => "{if $setActiveClass.questionOnItem}true{else}false{/if}",
                              "controls" => "tab-questionOnItem"
                          ]
                      } *}
                          {lang key='productQuestion' section='productDetails'}
                      {* {/cardheader} *}
                      {collapse id="tab-questionOnItem"|cat:$quickViewIdPostfix
                            visible=$setActiveClass.questionOnItem
                            data=["parent"=>"#tabAccordion"|cat:$quickViewIdPostfix]
                            aria=["labelledby"=>"tab-question-head"|cat:$quickViewIdPostfix]
                        }
                          {* {cardbody} *}
                              {block name='productdetails-tabs-include-question-on-item'}
                                  {opcMountPoint id='opc_before_tab_question'}
                                  {include file='productdetails/question_on_item.tpl' position="tab"}
                                  {opcMountPoint id='opc_after_tab_question'}
                              {/block}
                          {* {/cardbody} *}
                      {/collapse}
                  {* {/card} *}
              {/block}
          {/if}

          {if $usePriceFlow}
              {block name='productdetails-tabs-price-flow'}
                  {* {card no-body=true}
                      {cardheader id="tab-priceFlow-head"
                          data=["toggle" => "collapse",
                              "target"=>"#tab-priceFlow"
                          ]
                          aria=["expanded" => "{if $setActiveClass.priceFlow}true{else}false{/if}",
                              "controls" => "tab-priceFlow"
                          ]
                      } *}
                          {lang key='priceFlow' section='productDetails'}
                      {* {/cardheader} *}
                      {collapse id="tab-priceFlow"|cat:$quickViewIdPostfix
                            visible=$setActiveClass.priceFlow
                            data=["parent"=>"#tabAccordion"|cat:$quickViewIdPostfix]
                            aria=["labelledby"=>"tab-priceFlow-head"|cat:$quickViewIdPostfix]
                        }
                          {* {cardbody} *}
                              {block name='productdetails-tabs-include-price-history'}
                                  {opcMountPoint id='opc_before_tab_price_history'}
                                  {include file='productdetails/price_history.tpl'}
                                  {opcMountPoint id='opc_after_tab_price_history'}
                              {/block}
                          {* {/cardbody} *}
                      {/collapse}
                  {* {/card} *}
              {/block}
          {/if}

          {if $useAvailabilityNotification}
              {block name='productdetails-tabs-availability-notification'}
                  {* {card no-body=true}
                      {cardheader id="tab-availabilityNotification-head"
                          data=["toggle" => "collapse",
                              "target"=>"#tab-availabilityNotification"
                          ]
                          aria=["expanded" => "{if $setActiveClass.availabilityNotification}true{else}false{/if}",
                              "controls" => "tab-availabilityNotification"
                          ]
                      } *}
                      {lang key='notifyMeWhenProductAvailableAgain'}
                      {* {/cardheader} *}
                      {collapse id="tab-availabilityNotification"|cat:$quickViewIdPostfix
                            visible=$setActiveClass.availabilityNotification
                            data=["parent"=>"#tabAccordion"|cat:$quickViewIdPostfix]
                            aria=["labelledby"=>"tab-availabilityNotification-head"|cat:$quickViewIdPostfix]
                        }
                          {* {cardbody} *}
                              {block name='productdetails-tabs-include-availability-notification-form'}
                                  {opcMountPoint id='opc_before_tab_availability'}
                                  {include file='productdetails/availability_notification_form.tpl' position='tab' tplscope='artikeldetails'}
                                  {opcMountPoint id='opc_after_tab_availability'}
                              {/block}
                          {* {/cardbody} *}
                      {/collapse}
                  {* {/card} *}
              {/block}
          {/if}
      {* </div> *}
  {/container}
{/block}