{extends file="{$parent_template_path}/snippets/product_slider.tpl"}

{block name='snippets-product-slider-other-products'}
    {* {capture productSliderClass}
        {block name='product-slider-class'}{if $tplscope === 'half'}slider-half{else}product-slider{/if}{/block}
    {/capture}
    {row class="carousel {if $tplscope === 'half'}slick-type-half{else}slick-type-product{/if} {if $productlist|count < 3}slider-no-preview{/if}"
        data=["slick-type"=>$smarty.capture.productSliderClass]}
        {include file='snippets/slider_items.tpl' items=$productlist type='product'}
    {/row} *}

    {* {capture productSliderClass}
        {block name='product-slider-class'}{if $tplscope === 'half'}slider-half{else}product-slider{/if}{/block}
    {/capture}
    {row class="slick-lazy slick-smooth-loading carousel carousel-arrows-inside {if $tplscope === 'half'}slick-type-half{else}slick-type-product{/if} {if $productlist|count < 3}slider-no-preview{/if}"
        data=["slick-type"=>$smarty.capture.productSliderClass, "slick"=>$slickOptions|escape]}
        {include file='snippets/slider_items.tpl' items=$productlist type='product'}
    {/row} *}

    {assign var="slickOptions" value='{
                                    "infinite": true,
                                    "slidesToShow": 3,
                                    "slidesToScroll": 3,
                                    "responsive": [
                                        {
                                            "breakpoint": 1250,
                                            "settings": {
                                                "slidesToShow": 2,
                                                "slidesToScroll": 2,
                                                "infinite": true
                                            }
                                        },
                                        {
                                            "breakpoint": 600,
                                            "settings": {
                                                "slidesToShow": 1,
                                                "slidesToScroll": 1,
                                                "infinite": true
                                            }
                                        }
                                    ]
                                }' nocache}
    {capture productSliderClass}
        {block name='product-slider-class'}{if $tplscope === 'half'}slider-half{else}product-slider{/if}{/block}
    {/capture}
    {* {row class="slick-lazy slick-smooth-loading carousel carousel-arrows-inside {if $tplscope === 'half'}slick-type-half{else}slick-type-product{/if} {if $productlist|count < 3}slider-no-preview{/if}"
        data=["slick-type"=>$smarty.capture.productSliderClass, "slick"=>$slickOptions|escape]} *}
    {$style = ''}
        {if !empty($displayCounts)}
            {$style = "--display-count-sm:`$displayCounts[0]`;--display-count-md:`$displayCounts[1]`;
                        --display-count-lg:`$displayCounts[2]`;--display-count-xl:`$displayCounts[3]`"}
        {/if}
        {row class="slick-lazy slick-smooth-loading carousel carousel-arrows-inside
                {if $tplscope === 'half'}slick-type-half{else}slick-type-product{/if}
                {if $productlist|count < 3}slider-no-preview{/if}"
            data=[
                "slick-type" => $smarty.capture.productSliderClass,
                "display-counts" => implode(',', $displayCounts|default:[]),
                "slick"=>$slickOptions|escape
            ]
            style=$style
        }
        {include file='snippets/slider_items.tpl' items=$productlist type='product'}
    {/row}


{/block}

