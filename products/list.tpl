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

<script type="text/javascript">//<![CDATA[
    function fnSetClassCategories(form, classcat_id2_selected) {
        var $form = $(form);
        var product_id = $form.find('input[name=product_id]').val();
        var $sele1 = $form.find('select[name=classcategory_id1]');
        var $sele2 = $form.find('select[name=classcategory_id2]');
        eccube.setClassCategories($form, product_id, $sele1, $sele2, classcat_id2_selected);
    }
    // 並び順を変更
    function fnChangeOrderby(orderby) {
        eccube.setValue('orderby', orderby);
        eccube.setValue('pageno', 1);
        eccube.submitForm();
    }
    // 表示件数を変更
    function fnChangeDispNumber(dispNumber) {
        eccube.setValue('disp_number', dispNumber);
        eccube.setValue('pageno', 1);
        eccube.submitForm();
    }
    // カートに入れる
    function fnInCart(productForm) {
        var searchForm = $("#form1");
        var cartForm = $(productForm);
        // 検索条件を引き継ぐ
        var hiddenValues = ['mode','category_id','maker_id','name','orderby','disp_number','pageno','rnd'];
        $.each(hiddenValues, function(){
            // 商品別のフォームに検索条件の値があれば上書き
            if (cartForm.has('input[name='+this+']').length != 0) {
                cartForm.find('input[name='+this+']').val(searchForm.find('input[name='+this+']').val());
            }
            // なければ追加
            else {
                cartForm.append($('<input type="hidden" />').attr("name", this).val(searchForm.find('input[name='+this+']').val()));
            }
        });
        // 商品別のフォームを送信
        cartForm.submit();
    }
//]]></script>

<div id="undercolumn">
    <form name="form1" id="form1" method="get" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="<!--{$mode|h}-->" />
        <!--{* ▼検索条件 *}-->
        <input type="hidden" name="category_id" value="<!--{$arrSearchData.category_id|h}-->" />
        <input type="hidden" name="maker_id" value="<!--{$arrSearchData.maker_id|h}-->" />
        <input type="hidden" name="name" value="<!--{$arrSearchData.name|h}-->" />
        <!--{* ▲検索条件 *}-->
        <!--{* ▼ページナビ関連 *}-->
        <input type="hidden" name="orderby" value="<!--{$orderby|h}-->" />
        <input type="hidden" name="disp_number" value="<!--{$disp_number|h}-->" />
        <input type="hidden" name="pageno" value="<!--{$tpl_pageno|h}-->" />
        <!--{* ▲ページナビ関連 *}-->
        <input type="hidden" name="rnd" value="<!--{$tpl_rnd|h}-->" />
    </form>

    <!--★タイトル★-->
    <h2 class="title"><!--{$tpl_subtitle|h}--> <small><span class="attention"><!--{$tpl_linemax}-->件</span>の商品</small></h2>

    <!--▼検索条件-->
    <!--{if $tpl_subtitle == "検索結果"}-->
        <ul class="pagecond_area list-unstyled alert alert-warning">
            <li><strong>商品カテゴリ：</strong><!--{$arrSearch.category|h}--></li>
        <!--{if $arrSearch.maker|strlen >= 1}--><li><strong>メーカー：</strong><!--{$arrSearch.maker|h}--></li><!--{/if}-->
            <li><strong>キーワード：</strong><!--{$arrSearch.name|h}--></li>
        </ul>
    <!--{/if}-->
    <!--▲検索条件-->

    <!--▼ページナビ(本文)-->
    <!--{capture name=page_navi_body}-->
    <!--{* ページナビ上部及び下部に移動 *}-->
    <!--{/capture}-->
    <!--▲ページナビ(本文)-->

    <!--{foreach from=$arrProducts item=arrProduct name=arrProducts}-->

        <!--{if $smarty.foreach.arrProducts.first}-->
            <!--▼ページナビ(上部)-->
            <form name="page_navi_top" id="page_navi_top" action="?">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <!--{if $tpl_linemax > 0}--><!--{$smarty.capture.page_navi_body|smarty:nodefaults}--><!--{/if}-->
            </form>
            <div class="pagenumber_area clearfix">
                <div class="change btn-group btn-group-justified">
                    <!--{if $orderby != 'price'}-->
                        <a href="javascript:fnChangeOrderby('price');" class="btn btn-default">価格順</a>
                    <!--{else}-->
                        <strong class="btn btn-default active">価格順</strong>
                    <!--{/if}-->
                    <!--{if $orderby != "date"}-->
                            <a href="javascript:fnChangeOrderby('date');" class="btn btn-default">新着順</a>
                    <!--{else}-->
                        <strong class="btn btn-default active">新着順</strong>
                    <!--{/if}-->
                    <div class="disp_number btn-group">
                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            表示件数 <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                        <!--{foreach from=$arrPRODUCTLISTMAX item="dispnum" key="num"}-->
                            <!--{if $num == $disp_number}-->
                                <li><a href="javascript:fnChangeDispNumber(<!--{$num}-->);"><strong><!--{$dispnum}--></strong></a></li>
                            <!--{else}-->
                                <li><a href="javascript:fnChangeDispNumber(<!--{$num}-->);"><!--{$dispnum}--></a></li>
                            <!--{/if}-->
                        <!--{/foreach}-->
                        </ul>
                    </div>
                </div>
            </div>
            <!--▲ページナビ(上部)-->
            <!--▼商品wrap-->
            <div id="product-list-wrap" class="clearfix">
        <!--{/if}-->

                <!--{assign var=id value=$arrProduct.product_id}-->
                <!--{assign var=arrErr value=$arrProduct.arrErr}-->
                <!--▼商品-->
                <div class="list_area clearfix col-sm-4 col-md-3">
                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->" class="thumbnail">

                    <!--★SOLD OUT★-->
                    <!--{if !$tpl_stock_find[$id]}-->
                        <span class="soldout label label-danger fa-rotate-45">SOLD OUT</span>
                    <!--{/if}-->

                    <!--★画像★-->
                        <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_image|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" class="picture col-xs-5 col-sm-12" />
                        <div class="caption">
                            <!--▼商品ステータス-->

                            <!--{if count($productStatus[$id]) > 0}-->
                                <div class="status_icon">
                                <!--{foreach from=$productStatus[$id] item=status}-->
                                    <span class="label
                                        <!--{if $status == 1}-->
                                        label-primary
                                        <!--{elseif $status == 2}-->
                                        label-success
                                        <!--{elseif $status == 3}-->
                                        label-warning
                                        <!--{elseif $status == 4}-->
                                        label-danger
                                        <!--{elseif $status == 5}-->
                                        label-info
                                        <!--{else}-->
                                        label-default
                                        <!--{/if}-->"><!--{$arrSTATUS[$status]}--></span>
                                <!--{/foreach}-->
                                </div>
                            <!--{/if}-->

                            <!--★商品名★-->
                            <h3>
                                <!--{$arrProduct.name|mb_substr:0:21|h}--><!--{if $arrProduct.name|mb_strlen > 21}-->..<!--{/if}-->
                            </h3>
                            <!--★価格★-->
                            <div class="pricebox">
                                <span class="price">
                                    <span id="price02_default_<!--{$id}-->"><!--{strip}-->
                                        <!--{if $arrProduct.price02_min_inctax == $arrProduct.price02_max_inctax}-->
                                            <!--{$arrProduct.price02_min_inctax|number_format}-->円
                                        <!--{else}-->
                                            <!--{$arrProduct.price02_min_inctax|number_format}-->円～
                                        <!--{/if}-->
                                    </span><!--{/strip}-->
                                </span>
                            </div>
                            <!--★コメント★-->
                            <div class="listcomment"><!--{$arrProduct.main_list_comment|h|nl2br}--></div>

                            <!--▼買い物かご-->
                            <div class="cart_area clearfix">
                            </div>
                            <!--▲買い物かご-->
                        </div>
                        <div class="visible-xs btn-arrow">
                            <span class="fa fa-angle-right"></span>
                        </div>
                    </a>
                </div>
                <!--▲商品-->

        <!--{if $smarty.foreach.arrProducts.last}-->
            </div>
            <!--▲商品wrap-->
            <!--▼ページナビ(下部)-->
            <form name="page_navi_bottom" id="page_navi_bottom" action="?">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <!--{if $tpl_linemax > 0}--><!--{$smarty.capture.page_navi_body|smarty:nodefaults}--><!--{/if}-->
            </form>
            <div class="navi pagination hidden-xs"><!--{$tpl_strnavi}--></div>
            <!--{include file= "pager.tpl"}-->
            <!--▲ページナビ(下部)-->
        <!--{/if}-->

    <!--{foreachelse}-->
        <!--{include file="frontparts/search_zero.tpl"}-->
    <!--{/foreach}-->

</div>
