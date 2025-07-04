{extends file="{$parent_template_path}/productdetails/pushed_success.tpl"}

{block name='productdetails-pushed-success'}
    <script type="text/javascript">
        $(function() {
            $('.cart-icon-dropdown, .cart-dropdown').addClass('show');
        });
        $(document).on("click", function (event) {
            if ($(event.target).closest(".cart-dropdown").length === 0) {
                $('.cart-icon-dropdown, .cart-dropdown').removeClass('show');
            }
        });
    </script>

    {block name='productdetails-pushed-success-cart-note-heading'}
        <div class="alert alert-success">
            {if isset($cartNote)}
                {$cartNote}
            {/if}
        </div>
    {/block}
{/block}