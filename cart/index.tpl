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

<div id="undercolumn">
    <div id="undercolumn_cart">
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <!--{if $smarty.const.USE_POINT !== false || count($arrProductsClass) > 0}-->
            <!--★ポイント案内★-->
            <!--{if $smarty.const.USE_POINT !== false}-->
                <div class="point_announce alert alert-warning">
                    <!--{if $tpl_login}-->
                        <span class="user_name"><!--{$tpl_name|h}--> 様</span>の、現在の所持ポイントは「<span class="point"><!--{$tpl_user_point|number_format|default:0|h}--> pt</span>」です。<br />
                    <!--{else}-->
                        ポイント制度をご利用になられる場合は、会員登録後ログインしてくださいますようお願い致します。<br />
                    <!--{/if}-->
                    ポイントは商品購入時に<span class="price">1pt＝<!--{$smarty.const.POINT_VALUE|h}-->円</span>として使用することができます。
                </div>
            <!--{/if}-->
        <!--{/if}-->

        <p class="totalmoney_area">
            <!--{* カートの中に商品がある場合にのみ表示 *}-->
            <!--{if count($cartKeys) > 1}-->
                <div class="alert alert-danger">
                    <span class="fa fa-warning"></span>
                    <!--{foreach from=$cartKeys item=key name=cartKey}--><!--{$arrProductType[$key]|h}--><!--{if !$smarty.foreach.cartKey.last}-->、<!--{/if}--><!--{/foreach}-->は同時購入できません。
                    お手数ですが、個別に購入手続きをお願い致します。
                </div>
            <!--{/if}-->

            <!--{if strlen($tpl_error) != 0}-->
                <div class="alert alert-danger"><span class="fa fa-warning"></span><!--{$tpl_error|h}--></div>
            <!--{/if}-->

            <!--{if strlen($tpl_message) != 0}-->
                <div class="alert alert-danger"><span class="fa fa-warning"></span><!--{$tpl_message|h|nl2br}--></div>
            <!--{/if}-->
        </p>

        <!--{if count($cartItems) > 0}-->
            <!--{foreach from=$cartKeys item=key}-->
                <form name="form<!--{$key|h}-->" id="form<!--{$key|h}-->" method="post" action="?">
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|h}-->" value="<!--{$transactionid|h}-->" />
                    <input type="hidden" name="mode" value="confirm" />
                    <input type="hidden" name="cart_no" value="" />
                    <input type="hidden" name="cartKey" value="<!--{$key|h}-->" />
                    <input type="hidden" name="category_id" value="<!--{$tpl_category_id|h}-->" />
                    <input type="hidden" name="product_id" value="<!--{$tpl_product_id|h}-->" />

                    <div class="form_area panel panel-default">
                        <!--{if count($cartKeys) > 1}-->
                            <div class="panel-heading">
                                <h3 class="margin-none padding-none"><!--{$arrProductType[$key]|h}--></h3>
                            </div>
                            <!--{assign var=purchasing_goods_name value=$arrProductType[$key]}-->
                        <!--{else}-->
                            <!--{assign var=purchasing_goods_name value="カートの中の商品"}-->
                        <!--{/if}-->
                        <div class="list-group">
                            <div class="list-group-item">
                                <!--{$purchasing_goods_name|h}-->の合計金額は「<span class="price"><!--{$tpl_total_inctax[$key]|number_format|h}-->円</span>」です。
                                <!--{if $key != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                                    <!--{if $arrInfo.free_rule > 0}-->
                                        <!--{if !$arrData[$key].is_deliv_free}-->
                                            あと「<span class="price"><!--{$tpl_deliv_free[$key]|number_format|h}-->円</span>」で送料無料です！！
                                        <!--{else}-->
                                            現在、「<span class="attention">送料無料</span>」です！！
                                        <!--{/if}-->
                                    <!--{/if}-->
                                <!--{/if}-->
                            </div>

                            <!--{foreach from=$cartItems[$key] item=item}-->
                            <div class="list-group-item clearfix cart-items" style="<!--{if $item.error}-->background-color: <!--{$smarty.const.ERR_COLOR|h}-->;<!--{/if}-->">

                                <div class="clearfix">
                                    <div class="delete-cart col-xs-12 text-right">
                                        <a class="btn-delete" href="?" onclick="eccube.fnFormModeSubmit('form<!--{$key|h}-->', 'delete', 'cart_no', '<!--{$item.cart_no|h}-->'); return false;">
                                            <span class="fa fa-trash-o fa-lg"></span><span class="hidden-xs"> <small>カートから削除</small></span>
                                        </a>
                                    </div>

                                    <div class="col-xs-3 col-sm-3 col-md-2 padding-left-none padding-right-none">
                                    <!--{if $item.productsClass.main_image|strlen >= 1}-->
                                        <a class="expansion" target="_blank" href="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$item.productsClass.main_image|sfNoImageMainList|h}-->">
                                    <!--{/if}-->
                                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.productsClass.main_list_image|sfNoImageMainList|h}-->" class="img-responsive" alt="<!--{$item.productsClass.name|h}-->" />
                                            <!--{if $item.productsClass.main_image|strlen >= 1}-->
                                        </a>
                                    <!--{/if}-->
                                    </div>
                                    <div class="col-xs-9 col-sm-9 col-md-10"><!--{* 商品名 *}-->
                                        <strong class="cart-item-title">
                                            <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$item.productsClass.product_id|u}-->"><!--{$item.productsClass.name|h}--></a>
                                        </strong>
                                        <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                            <div><small><!--{$item.productsClass.class_name1|h}-->：<!--{$item.productsClass.classcategory_name1|h}--></small></div>
                                        <!--{/if}-->
                                        <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                            <div><small><!--{$item.productsClass.class_name2|h}-->：<!--{$item.productsClass.classcategory_name2|h}--></small></div>
                                        <!--{/if}-->
                                        <div class="cart-item-price">
                                            価格: <!--{$item.price_inctax|number_format|h}-->円
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-9 col-sm-push-3 col-md-10 col-md-push-2 text-right">
                                    <hr>
                                    <div class="pull-left">
                                        数量: <!--{$item.quantity|h}-->
                                        <div id="quantity_level" class="btn-group btn-group-sm">
                                            <a href="?" class="btn btn-default btn" onclick="eccube.fnFormModeSubmit('form<!--{$key|h}-->','up','cart_no','<!--{$item.cart_no|h}-->'); return false">
                                                <span class="fa fa-plus"></span>
                                            </a>
                                            <a href="?" class="btn btn-default btn" onclick="eccube.fnFormModeSubmit('form<!--{$key|h}-->','down','cart_no','<!--{$item.cart_no|h}-->'); return false" <!--{if $item.quantity == 1}-->disabled="disabled"<!--{/if}-->>
                                                <span class="fa fa-minus"></span>
                                            </a>
                                        </div>
                                    </div>
                                    <small>小計: </small><!--{$item.total_inctax|number_format|h}-->円
                                </div>

                            </div>
                            <!--{/foreach}-->
                            <div class="list-group-ite panel-footer clearfix">
                                <div class="col-xs-12 text-right">
                                    <small>合計: </small>
                                    <span class="price"><!--{$arrData[$key].total-$arrData[$key].deliv_fee|number_format|h}-->円</span>
                                </div>

                                <!--{if $smarty.const.USE_POINT !== false}-->
                                    <!--{if $arrData[$key].birth_point > 0}-->
                                    <div class="col-xs-12 text-right">
                                        <small>お誕生月ポイント:</small>
                                        <span><!--{$arrData[$key].birth_point|number_format|h}-->pt</span>
                                    </div>
                                    <!--{/if}-->
                                    <div class="col-xs-12 text-right">
                                        <small>今回加算ポイント:</small>
                                        <span><!--{$arrData[$key].add_point|number_format|h}-->pt</span>
                                    </div>
                                <!--{/if}-->
                            </div>
                        </div><!--{* list-group *}-->

                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-md-3 hidden-xs hidden-sm">
                                    <!--{if $tpl_prev_url != ""}-->
                                        <a href="<!--{$tpl_prev_url|h}-->" class="btn btn-default btn-block">お買い物を続ける</a>
                                    <!--{/if}-->
                                </div>
                            <!--{if strlen($tpl_error) == 0}-->
                                <div class="col-md-4 col-md-push-5">
                                    <button class="btn btn-success btn-block xs-btn-lg sm-btn-lg" name="confirm">ご購入手続きへ</button>
                                </div>
                            <!--{/if}-->
                            </div>
                        </div><!--{*panel-footer*}-->
                    </div>
                </form>
            <!--{/foreach}-->
            <!--{if $tpl_prev_url != ""}-->
            <div class="hidden-md hidden-lg">
                <a href="<!--{$tpl_prev_url|h}-->" class="btn btn-default btn-block btn-sm">お買い物を続ける</a>
            </div>
            <!--{/if}-->
        <!--{else}-->
            <p class="empty alert alert-warning">※ 現在カート内に商品はございません。</p>
        <!--{/if}-->
    </div>
</div>
