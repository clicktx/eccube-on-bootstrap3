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
    // 規格2に選択肢を割り当てる。
    function fnSetClassCategories(form, classcat_id2_selected) {
        var $form = $(form);
        var product_id = $form.find('input[name=product_id]').val();
        var $sele1 = $form.find('select[name=classcategory_id1]');
        var $sele2 = $form.find('select[name=classcategory_id2]');
        eccube.setClassCategories($form, product_id, $sele1, $sele2, classcat_id2_selected);
    }
//]]></script>

<div id="undercolumn">
    <form name="form1" id="form1" class="form-horizontal" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <div id="detailarea" class="clearfix row">
            <div id="detailphotobloc-wrap" class="col-md-5">
                <div id="detailphotobloc" class="">
                    <div class="photo margin-bottom-lg">
                        <!--{assign var=key value="main_image"}-->
                        <!--★画像★-->
                        <!--{if $arrProduct.main_large_image|strlen >= 1}-->
                            <a
                                href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_large_image|h}-->"
                                class="expansion"
                                target="_blank"
                            >
                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_large_image|h}-->" width="470" height="470" alt="<!--{$arrProduct.name|h}-->" class="picture img-responsive img-thumbnail center-block" />
                            </a>
                            <span class="mini">
                                    <!--★拡大する★-->
                                    <a
                                        href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_large_image|h}-->"
                                        class="expansion btn btn-link"
                                        target="_blank"
                                    >
                                        <span class="fa fa-search-plus"></span>
                                        画像を拡大する
                                    </a>
                            </span>
                        <!--{else}-->
                            <img src="<!--{$arrFile[$key].filepath|h}-->" width="470" height="470" alt="<!--{$arrProduct.name|h}-->" class="picture img-responsive img-thumbnail center-block" />
                        <!--{/if}-->
                    </div>
                </div>
            </div>
            <div id="detailrightbloc-wrap" class="col-md-7">
                <div id="detailrightbloc" class="panel panel-default">
                    <!--▼商品ステータス-->
                    <!--{assign var=ps value=$productStatus[$tpl_product_id]}-->
                    <!--{if count($ps) > 0}-->
                    <div class="panel-heading">
                        <div class="status_icon clearfix">
                            <!--{foreach from=$ps item=status}-->
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
                    </div>
                    <!--{/if}-->
                    <!--▲商品ステータス-->
                    <div id="detail-warp" class="panel-body">
                        <!--★商品名★-->
                        <h2 class="margin-none"><!--{$arrProduct.name|h}--></h2>

                        <!--★商品コード★-->
                        <dl class="product_code">
                            <dt>商品コード：</dt>
                            <dd>
                                <span id="product_code_default">
                                    <!--{if $arrProduct.product_code_min == $arrProduct.product_code_max}-->
                                        <!--{$arrProduct.product_code_min|h}-->
                                    <!--{else}-->
                                        <!--{$arrProduct.product_code_min|h}-->～<!--{$arrProduct.product_code_max|h}-->
                                    <!--{/if}-->
                                </span><span id="product_code_dynamic"></span>
                            </dd>
                        </dl>

                        <!--★通常価格★-->
                        <!--{if $arrProduct.price01_min_inctax > 0}-->
                            <dl class="normal_price">
                                <dt><!--{$smarty.const.NORMAL_PRICE_TITLE}-->(税込)：</dt>
                                <dd class="price">
                                    <span id="price01_default"><!--{strip}-->
                                        <!--{if $arrProduct.price01_min_inctax == $arrProduct.price01_max_inctax}-->
                                            <!--{$arrProduct.price01_min_inctax|number_format}-->
                                        <!--{else}-->
                                            <!--{$arrProduct.price01_min_inctax|number_format}-->～<!--{$arrProduct.price01_max_inctax|number_format}-->
                                        <!--{/if}-->
                                    <!--{/strip}--></span><span id="price01_dynamic"></span>
                                    円
                                </dd>
                            </dl>
                        <!--{/if}-->

                        <!--★販売価格★-->
                        <dl class="sale_price">
                            <dt><!--{$smarty.const.SALE_PRICE_TITLE}-->(税込)：</dt>
                            <dd class="price">
                                <span id="price02_default"><!--{strip}-->
                                    <!--{if $arrProduct.price02_min_inctax == $arrProduct.price02_max_inctax}-->
                                        <!--{$arrProduct.price02_min_inctax|number_format}-->
                                    <!--{else}-->
                                        <!--{$arrProduct.price02_min_inctax|number_format}-->～<!--{$arrProduct.price02_max_inctax|number_format}-->
                                    <!--{/if}-->
                                <!--{/strip}--></span><span id="price02_dynamic"></span>
                                円
                            </dd>
                        </dl>

                        <!--★ポイント★-->
                        <!--{if $smarty.const.USE_POINT !== false}-->
                            <div class="point">ポイント：
                                <span id="point_default"><!--{strip}-->
                                    <!--{if $arrProduct.price02_min == $arrProduct.price02_max}-->
                                        <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate|number_format}-->
                                    <!--{else}-->
                                        <!--{if $arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate == $arrProduct.price02_max|sfPrePoint:$arrProduct.point_rate}-->
                                            <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate|number_format}-->
                                        <!--{else}-->
                                            <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate|number_format}-->～<!--{$arrProduct.price02_max|sfPrePoint:$arrProduct.point_rate|number_format}-->
                                        <!--{/if}-->
                                    <!--{/if}-->
                                <!--{/strip}--></span><span id="point_dynamic"></span>
                                Pt
                            </div>
                        <!--{/if}-->

                        <!--{* ▼メーカー *}-->
                        <!--{if $arrProduct.maker_name|strlen >= 1}-->
                            <dl class="maker">
                                <dt>メーカー：</dt>
                                <dd><!--{$arrProduct.maker_name|h}--></dd>
                            </dl>
                        <!--{/if}-->
                        <!--{* ▲メーカー *}-->

                        <!--▼メーカーURL-->
                        <!--{if $arrProduct.comment1|strlen >= 1}-->
                            <dl class="comment1">
                                <dt>メーカーURL：</dt>
                                <dd><a href="<!--{$arrProduct.comment1|h}-->"><!--{$arrProduct.comment1|h}--></a></dd>
                            </dl>
                        <!--{/if}-->
                        <!--▼メーカーURL-->

                        <!--★関連カテゴリ★-->
                        <dl class="relative_cat">
                            <dt>関連カテゴリ：</dt>
                            <!--{section name=r loop=$arrRelativeCat}-->
                                <dd>
                                    <!--{section name=s loop=$arrRelativeCat[r]}-->
                                        <a href="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php?category_id=<!--{$arrRelativeCat[r][s].category_id}-->"><!--{$arrRelativeCat[r][s].category_name|h}--></a>
                                        <!--{if !$smarty.section.s.last}--><!--{$smarty.const.SEPA_CATNAVI}--><!--{/if}-->
                                    <!--{/section}-->
                                </dd>
                            <!--{/section}-->
                        </dl>

                        <!--★詳細メインコメント★-->
                        <div class="main_comment"><!--{$arrProduct.main_comment|nl2br_html}--></div>
                    </div>

                    <!--▼買い物かご-->
                    <div id="cart_area-wrap" class="panel-footer">
                        <div class="cart_area clearfix">
                            <input type="hidden" name="mode" value="cart" />
                            <input type="hidden" name="product_id" value="<!--{$tpl_product_id}-->" />
                            <input type="hidden" name="product_class_id" value="<!--{$tpl_product_class_id}-->" id="product_class_id" />
                            <input type="hidden" name="favorite_product_id" value="" />

                            <!--{if $tpl_stock_find}-->
                                <!--{if $tpl_classcat_find1}-->
                                    <div class="classlist margin-bottom-lg">
                                        <!--▼規格1-->
                                        <div class="clearfix form-group<!--{if $arrErr.classcategory_id1 != ""}--> has-error<!--{/if}-->">
                                            <label for="classcategory_id1" class="col-sm-5 control-label"><!--{$tpl_class_name1|h}-->：</label>
                                            <div class="col-sm-7">
                                                <select id="classcategory_id1" class="form-control" name="classcategory_id1" style="<!--{$arrErr.classcategory_id1|sfGetErrorColor}-->">
                                                <!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1.value}-->
                                                </select>
                                                <!--{if $arrErr.classcategory_id1 != ""}-->
                                                <br /><label class="attention" for="classcategory_id1">※ <!--{$tpl_class_name1}-->を入力して下さい。</label>
                                                <!--{/if}-->
                                            </div>
                                        </div>
                                        <!--▲規格1-->
                                        <!--{if $tpl_classcat_find2}-->
                                        <!--▼規格2-->
                                        <div class="clearfix form-group<!--{if $arrErr.classcategory_id2 != ""}--> has-error<!--{/if}-->">
                                            <label for="classcategory_id2" class="col-sm-5 control-label"><!--{$tpl_class_name2|h}-->：</label>
                                            <div class="col-sm-7">
                                                <select id="classcategory_id2" class="form-control" name="classcategory_id2" style="<!--{$arrErr.classcategory_id2|sfGetErrorColor}-->">
                                                </select>
                                                <!--{if $arrErr.classcategory_id2 != ""}-->
                                                <br /><label class="attention" for="classcategory_id2">※ <!--{$tpl_class_name2}-->を入力して下さい。</label>
                                                <!--{/if}-->
                                            </div>
                                        </div>
                                        <!--▲規格2-->
                                        <!--{/if}-->
                                    </div>
                                <!--{/if}-->

                                <!--★数量★-->
                                <div class="row form-group">
                                    <div class="quantity col-xs-6 col-sm-5">
                                        <div class="input-group<!--{if $arrErr.quantity != ""}--> has-error<!--{/if}-->">
                                            <span class="input-group-addon">数量</span>
                                            <input type="number" id="cart-quantity" class="box60 form-control" name="quantity" value="<!--{$arrForm.quantity.value|default:1|h}-->" maxlength="<!--{$smarty.const.INT_LEN}-->" min="1" style="<!--{$arrErr.quantity|sfGetErrorColor}-->" />
                                        </div>
                                        <!--{if $arrErr.quantity != ""}-->
                                            <br /><label class="attention" for="cart-quantity"><!--{$arrErr.quantity}--></label>
                                        <!--{/if}-->
                                    </div>

                                    <div class="cartin col-xs-6 col-sm-7">
                                        <div class="cartin_btn">
                                            <div id="cartbtn_default">
                                                <!--★カートに入れる★-->
                                                <a href="javascript:void(document.form1.submit())" class="btn btn-danger btn-block">
                                                    <span class="glyphicon glyphicon-shopping-cart"></span> カートに追加
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="attention" id="cartbtn_dynamic"></div>
                            <!--{else}-->
                                <div class="attention">申し訳ございませんが、只今品切れ中です。</div>
                            <!--{/if}-->

                            <!--★お気に入り登録★-->
                            <!--{if $smarty.const.OPTION_FAVORITE_PRODUCT == 1 && $tpl_login === true}-->
                                <hr />
                                <div class="favorite_btn">
                                    <!--{assign var=add_favorite value="add_favorite`$product_id`"}-->
                                    <!--{if $arrErr[$add_favorite]}-->
                                        <div class="attention"><!--{$arrErr[$add_favorite]}--></div>
                                    <!--{/if}-->
                                    <!--{if !$is_favorite}-->
                                        <a href="javascript:eccube.changeAction('?product_id=<!--{$arrProduct.product_id|h}-->'); eccube.setModeAndSubmit('add_favorite','favorite_product_id','<!--{$arrProduct.product_id|h}-->');" class="btn btn-default btn-sm btn-block"><span class="glyphicon glyphicon-star-empty"></span> お気に入りに追加</a>
                                    <!--{else}-->
                                        <button class="btn btn-default btn-sm btn-block" disabled="disabled"><span class="glyphicon glyphicon-star"></span> お気に入りに追加済み</button>
                                    <!--{/if}-->
                                </div>
                            <!--{/if}-->
                        </div>
                    </div>
                </div>
            </div>
            <!--▲買い物かご-->
        </div>
    </form>

    <!--詳細ここまで-->

    <!--▼サブコメント-->
    <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
        <!--{assign var=key value="sub_title`$smarty.section.cnt.index+1`"}-->
        <!--{assign var=ikey value="sub_image`$smarty.section.cnt.index+1`"}-->
        <!--{if $arrProduct[$key] != "" or $arrProduct[$ikey]|strlen >= 1}-->
            <div class="sub_area clearfix">
                <div class="jumbotron padding-sm panel-heading margin-bottom-none">
                    <h3><!--★サブタイトル★--><!--{$arrProduct[$key]|h}--></h3>
                </div>
                <div class="panel-body row">
                <!--{assign var=ckey value="sub_comment`$smarty.section.cnt.index+1`"}-->
                <!--▼サブ画像-->
                <!--{assign var=lkey value="sub_large_image`$smarty.section.cnt.index+1`"}-->
                <!--{if $arrProduct[$ikey]|strlen >= 1}-->
                    <!--{if $arrProduct[$ckey]|strlen >= 1}-->
                    <div class="subtext col-md-8"><!--★サブテキスト★--><!--{$arrProduct[$ckey]|nl2br_html}--></div>
                    <!--{/if}-->
                    <div class="subphotoimg text-center<!--{if $arrProduct[$ckey]|strlen >= 1}--> col-md-4<!--{else}--> col-xs-12 margin-top-lg<!--{/if}-->">
                        <!--{if $arrProduct[$lkey]|strlen >= 1}-->
                            <a href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct[$lkey]|h}-->" class="expansion" target="_blank" >
                        <!--{/if}-->
                        <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct[$lkey]|h}-->" alt="<!--{$arrProduct.name|h}-->" class="img-responsive" width="100%" />
                        <!--{if $arrProduct[$lkey]|strlen >= 1}-->
                            </a>
                            <br />
                            <span class="mini">
                                <a href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct[$lkey]|h}-->" class="expansion btn btn-link" target="_blank">
                                    <span class="fa fa-search-plus"></span>
                                    画像を拡大する
                                </a>
                            </span>
                        <!--{/if}-->
                    </div>
                <!--{else}-->
                    <div class="subtext col-xs-12"><!--★サブテキスト★--><!--{$arrProduct[$ckey]|nl2br_html}--></div>
                <!--{/if}-->
                <!--▲サブ画像-->
                </div>
            </div>
        <!--{/if}-->
    <!--{/section}-->
    <!--▲サブコメント-->

    <!--この商品に対するお客様の声-->
    <div id="customervoice_area">
        <div class="well-sm bg-warning panel-heading">
            <h2 class="text-warning"><span class="fa fa-comment fa-flip-horizontal"></span> 商品レビュー</h2>
        </div>

        <div class="review_bloc clearfix bg-def panel-body">
            <p>この商品に対するご感想をぜひお寄せください。</p>
            <div class="review_btn">
                <!--{if count($arrReview) < $smarty.const.REVIEW_REGIST_MAX}-->
                    <!--★新規コメントを書き込む★-->
                    <a href="./review.php"
                        onclick="eccube.openWindow('./review.php?product_id=<!--{$arrProduct.product_id}-->','review','600','640'); return false;"
                        target="_blank" class="btn btn-default btn-sm">
                        <span class="fa fa-pencil-square-o"></span> 新規コメントを書き込む
                    </a>
                <!--{/if}-->
            </div>
        </div>

        <!--{if count($arrReview) > 0}-->
            <ul class="media-list panel-body">
                <!--{section name=cnt loop=$arrReview}-->
                    <li class="media">
                        <span class="fa fa-comment-o fa-flip-horizontal pull-left"></span>
                        <div class="media-body">
                            <h4 class="voicetitle media-heading"><!--{$arrReview[cnt].title|h}--></h4>
                            <p class="voicedate"><!--{$arrReview[cnt].create_date|sfDispDBDate:false}-->　投稿者：<!--{if $arrReview[cnt].reviewer_url}--><a href="<!--{$arrReview[cnt].reviewer_url}-->" target="_blank"><!--{$arrReview[cnt].reviewer_name|h}--></a><!--{else}--><!--{$arrReview[cnt].reviewer_name|h}--><!--{/if}-->　おすすめレベル：<span class="recommend_level"><!--{assign var=level value=$arrReview[cnt].recommend_level}--><!--{$arrRECOMMEND[$level]|h}--></span></p>
                            <p class="voicecomment"><!--{$arrReview[cnt].comment|h|nl2br}--></p>
                        <hr />
                        </div>
                    </li>
                <!--{/section}-->
            </ul>
        <!--{/if}-->
    </div>
    <!--お客様の声ここまで-->

    <!--▼関連商品-->
    <!--{if $arrRecommend}-->
        <div id="whobought_area">
            <div class="well-sm bg-warning panel-heading margin-bottom-lg">
                <h2 class="text-warning">
                    <span class="fa fa-thumbs-o-up"></span> その他のオススメ商品
                </h2>
            </div>
            <div class="panel-body">
            <!--{foreach from=$arrRecommend item=arrItem name="arrRecommend"}-->
                <div class="product_item media">
                    <div class="productImage pull-left">
                        <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrItem.product_id|u}-->">
                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrItem.main_list_image|sfNoImageMainList|h}-->" class="media-object img-thumbnail" style="max-width: 65px;max-height: 65px;" alt="<!--{$arrItem.name|h}-->" /></a>
                    </div>
                    <!--{assign var=price02_min value=`$arrItem.price02_min_inctax`}-->
                    <!--{assign var=price02_max value=`$arrItem.price02_max_inctax`}-->
                    <div class="productContents media-body">
                        <h3 class="media-heading"><a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrItem.product_id|u}-->"><!--{$arrItem.name|h}--></a></h3>
                        <p class="sale_price"><!--{$smarty.const.SALE_PRICE_TITLE}-->(税込)：<span class="price">
                            <!--{if $price02_min == $price02_max}-->
                                <!--{$price02_min|number_format}-->
                            <!--{else}-->
                                <!--{$price02_min|number_format}-->～<!--{$price02_max|number_format}-->
                            <!--{/if}-->円</span></p>
                        <p class="mini"><!--{$arrItem.comment|h|nl2br}--></p>
                    </div>
                </div><!--{* /.item *}-->
                <!--{if $smarty.foreach.arrRecommend.iteration % 2 === 0}-->
                    <div class="clear"></div>
                <!--{/if}-->
            <!--{/foreach}-->
            </div>
        </div>
    <!--{/if}-->
    <!--▲関連商品-->

</div>
