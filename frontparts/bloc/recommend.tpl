<!--{*
 * EC-CUBE on Bootstrap3. This file is part of EC-CUBE
 *
 * Copyright(c) 2014 clicktx. All Rights Reserved.
 *
 * http://perl.no-tubo.net/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->
<script>
    $(function(){
        $('#owl-container').owlCarousel({
            items: 4
            ,itemsDesktop: [1199,3]
            ,itemsDesktopSmall: [992,3]
            ,itemsTablet: [768,3]
            ,itemsMobile: [491,2]
        });
    });
</script>
<!--{strip}-->
    <!--{if count($arrBestProducts) > 0}-->
        <div class="block_outer">
            <div id="recommend_area">
                <div class="page-header">
                    <h2>
                        <span class="fa fa-star"></span> おすすめ商品
                        <small class="pull-right">
                            <a href="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php">
                                全ての商品
                            </a>
                        </small>
                    </h2>
                </div>
                <div id="owl-container" class="owl-carousel">
                    <!--{foreach from=$arrBestProducts item=arrProduct name="recommend_products"}-->
                        <div class="product_item col-xs-12 padding-xs">
                            <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->" class="thumbnail">
                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_image|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" class="img-responsive img-rounded" />
                                <div class="caption">
                                    <h4 class="recommend-title"><!--{$arrProduct.name|h}--></h4>
                                    <p class="recommend-price sale_price">
                                    <!--{$smarty.const.SALE_PRICE_TITLE}-->(税込)： <span class="price"><!--{$arrProduct.price02_min_inctax|number_format}--> 円</span>
                                    </p>
                                    <p class="recommend-comment mini comment"><!--{$arrProduct.comment|h|nl2br}--></p>
                                </div>
                            </a>
                        </div>
                        <!--{if $smarty.foreach.recommend_products.iteration % 2 === 0}-->
                            <!-- <div class="clear"></div> -->
                        <!--{/if}-->
                    <!--{/foreach}-->
                </div>
            </div>
        </div>
    <!--{/if}-->
<!--{/strip}-->
