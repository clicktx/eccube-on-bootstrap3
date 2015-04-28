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
    var sent = false;

    function fnCheckSubmit() {
        if (sent) {
            alert("只今、処理中です。しばらくお待ち下さい。");
            return false;
        }
        sent = true;
        return true;
    }
//]]></script>

<!--CONTENTS-->
<div id="undercolumn">
    <div id="undercolumn_shopping">
        <p class="flow_area">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`shopping/process/step3.tpl"}-->
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <p class="information">下記ご注文内容で送信してもよろしいでしょうか？<br />
            よろしければ、「<!--{if $use_module}-->次へ<!--{else}-->ご注文完了ページへ<!--{/if}-->」ボタンをクリックしてください。</p>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />

            <h3 class="margin-top-xl margin-bottom-md">
                <span class="fa fa-arrow-circle-right"></span> ご注文内容
                <div class="pull-right">
                    <a href="<!--{$smarty.const.CART_URL}-->" class="btn btn-default btn-xs"><span class="fa fa-pencil"></span> 変更</a>
                </div>
            </h3>
            <div class="list-group">
                <!--{foreach from=$arrCartItems item=item}-->
                    <div class="list-group-item clearfix">
                        <div class="col-xs-3 col-sm-2 col-md-1 padding-none">
                            <a
                                <!--{if $item.productsClass.main_image|strlen >= 1}--> href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.productsClass.main_image|sfNoImageMainList|h}-->" class="expansion" target="_blank"
                                <!--{/if}-->
                            >
                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.productsClass.main_list_image|sfNoImageMainList|h}-->" class="img-responsive" alt="<!--{$item.productsClass.name|h}-->" /></a>
                        </div>
                        <div class="col-xs-9 col-sm-10 col-md-11 padding-right-none">
                            <strong><!--{$item.productsClass.name|h}--></strong>
                            <ul class="list-unstyled">
                                <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                <li><small><!--{$item.productsClass.class_name1|h}-->：<!--{$item.productsClass.classcategory_name1|h}--></small></li>
                                <!--{/if}-->
                                <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                <li><small><!--{$item.productsClass.class_name2|h}-->：<!--{$item.productsClass.classcategory_name2|h}--></small></li>
                                <!--{/if}-->
                                <li><small>価格：<!--{$item.price_inctax|number_format}-->円</small></li>
                            </ul>
                        </div>
                        <div class="col-xs-12 text-right padding-none">
                            <div class="col-xs-4 col-xs-offset-3 col-sm-offset-5 col-md-offset-6 padding-none">
                                <small>数量：</small><strong><!--{$item.quantity|number_format}--></strong>
                            </div>
                            <div class="col-xs-5 col-sm-3 col-md-2 padding-none">
                                <small>小計：</small><strong><!--{$item.total_inctax|number_format}-->円</strong>
                            </div>
                        </div>
                    </div>
                <!--{/foreach}-->

                <div class="list-group-item panel-footer text-right">
                    <small>小計：</small><strong><!--{$tpl_total_inctax[$cartKey]|number_format}-->円</strong><br />
                    <!--{if $smarty.const.USE_POINT !== false}-->
                        <!--{if $arrForm.use_point > 0}-->
                            <small>値引き（ポイントご使用時）：</small>
                            <strong><!--{assign var=discount value=`$arrForm.use_point*$smarty.const.POINT_VALUE`}-->-<!--{$discount|number_format|default:0}-->円</strong><br />
                        <!--{/if}-->
                    <!--{/if}-->
                    <small>送料：</small><strong><!--{$arrForm.deliv_fee|number_format}-->円</strong><br />
                    <small>手数料：</small><strong><!--{$arrForm.charge|number_format}-->円</strong><br />
                </div>
                <div class="list-group-item panel-footer text-right">
                    <small>合計：</small><strong class="price"><!--{$arrForm.payment_total|number_format}-->円</strong>
                </div>
            </div>

            <!--{* ログイン済みの会員のみ *}-->
            <!--{if $tpl_login == 1 && $smarty.const.USE_POINT !== false}-->
                <div class="list-group text-bold">
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-xs-8">
                                ご注文前のポイント
                            </div>
                            <div class="col-xs-4 text-right">
                                <!--{$tpl_user_point|number_format|default:0}-->Pt
                            </div>
                        </div>
                    </div>
                    <!--{if $arrForm.use_point > 0}-->
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-xs-8">
                                ご使用ポイント
                            </div>
                            <div class="col-xs-4 text-right">
                                -<!--{$arrForm.use_point|number_format|default:0}-->Pt
                            </div>
                        </div>
                    </div>
                    <!--{/if}-->
                    <!--{if $arrForm.birth_point > 0}-->
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-xs-8">
                                お誕生月ポイント
                            </div>
                            <div class="col-xs-4 text-right">
                                +<!--{$arrForm.birth_point|number_format|default:0}-->Pt
                            </div>
                        </div>
                    </div>
                    <!--{/if}-->
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-xs-8">
                                今回加算予定のポイント
                            </div>
                            <div class="col-xs-4 text-right">
                                +<!--{$arrForm.add_point|number_format|default:0}-->Pt
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-xs-8">
                                加算後のポイント
                            </div>
                            <div class="col-xs-4 text-right">
                                <!--{assign var=total_point value=`$tpl_user_point-$arrForm.use_point+$arrForm.add_point`}-->
                                <!--{$total_point|number_format}-->Pt
                            </div>
                        </div>
                    </div>
                </div>
            <!--{/if}-->
            <!--{* ログイン済みの会員のみ *}-->

            <!--{* ▼注文者 *}-->
            <h3 class="margin-top-xl margin-bottom-md">
                <span class="fa fa-arrow-circle-right"></span> ご注文者
                <div class="pull-right">
                    <!--{if !$smarty.session.customer.customer_id}-->
                    <a href="./?mode=nonmember" class="btn btn-default btn-xs"><span class="fa fa-pencil"></span> 変更</a>
                    <!--{else}-->
                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/change.php" class="btn btn-default btn-xs"><span class="fa fa-pencil"></span> 変更</a>
                    <!--{/if}-->
                </div>
            </h3>
            <div class="panel panel-default">
                <div class="panel-body">
                    <small>
                        〒<!--{$arrForm.order_zip01|h}-->-<!--{$arrForm.order_zip02|h}--><br/>
                        <!--{$arrPref[$arrForm.order_pref]}--><!--{$arrForm.order_addr01|h}--><!--{$arrForm.order_addr02|h}--><br />
                        <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
                            <!--{$arrCountry[$arrForm.order_country_id]|h}--><br/>
                            ZIPCODE：<!--{$arrForm.order_zipcode|h}--><br/>
                        <!--{/if}-->
                    </small>
                    <!--{if $arrForm.order_company_name}-->
                        会社名：<!--{$arrForm.order_company_name|h}--><br />
                        担当者：<!--{$arrForm.order_name01|h}--> <!--{$arrForm.order_name02|h}--><br />
                    <!--{else}-->
                        <!--{$arrForm.order_name01|h}--> <!--{$arrForm.order_name02|h}-->
                        （<!--{$arrForm.order_kana01|h}--> <!--{$arrForm.order_kana02|h}-->）<br />
                    <!--{/if}-->
                    <small>
                        TEL：<!--{$arrForm.order_tel01}-->-<!--{$arrForm.order_tel02}-->-<!--{$arrForm.order_tel03}--><br />
                        <!--{if $arrForm.order_fax01 > 0}-->
                                FAX：<!--{$arrForm.order_fax01}-->-<!--{$arrForm.order_fax02}-->-<!--{$arrForm.order_fax03}--><br />
                        <!--{/if}-->
                        EMAIL：<!--{$arrForm.order_email|h}--><br />
                        性別：<!--{$arrSex[$arrForm.order_sex]|h}--><br />
                        職業：<!--{$arrJob[$arrForm.order_job]|default:'(未登録)'|h}--><br />
                        生年月日：<!--{$arrForm.order_birth|regex_replace:"/ .+/":""|regex_replace:"/-/":"/"|default:'(未登録)'|h}-->
                    </small>
                </div>
            </div>

            <!--{* ▼お届け先 *}-->
            <!--{if $arrShipping}-->
                <h3 class="margin-top-xl margin-bottom-md">
                    <span class="fa fa-arrow-circle-right"></span> お届け先
                    <div class="pull-right">
                        <a href="./payment.php?mode=return" class="btn btn-default btn-xs"><span class="fa fa-pencil"></span> 変更</a>
                    </div>
                </h3>
            <!--{/if}-->

            <!--{foreach item=shippingItem from=$arrShipping name=shippingItem}-->
                <div class="panel panel-default">
                    <div class="panel-heading text-bold">
                        お届け先
                    <!--{if $is_multiple}--><!--{$smarty.foreach.shippingItem.iteration}--><!--{/if}-->
                    </div>
                    <div class="list-group">
                        <div class="list-group-item">
                            <small>
                                〒<!--{$shippingItem.shipping_zip01|h}-->-<!--{$shippingItem.shipping_zip02|h}--><br />
                                <!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01|h}--><!--{$shippingItem.shipping_addr02|h}--><br />
                            <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
                                <!--{$arrCountry[$shippingItem.shipping_country_id]|h}-->
                                &nbsp;ZIPCODE：<!--{$shippingItem.shipping_zipcode|h}--><br />
                            <!--{/if}-->
                            </small>
                            <!--{if $shippingItem.shipping_company_name}-->
                                会社名：<!--{$shippingItem.shipping_company_name|h}--><br />
                                担当者：<!--{$shippingItem.shipping_name01|h}--> <!--{$shippingItem.shipping_name02|h}--><br />
                            <!--{else}-->
                                お名前：<!--{$shippingItem.shipping_name01|h}--> <!--{$shippingItem.shipping_name02|h}-->（<!--{$shippingItem.shipping_kana01|h}--> <!--{$shippingItem.shipping_kana02|h}-->）<br />
                            <!--{/if}-->
                            <small>
                                TEL：<!--{$shippingItem.shipping_tel01}-->-<!--{$shippingItem.shipping_tel02}-->-<!--{$shippingItem.shipping_tel03}--><br />
                            <!--{if $shippingItem.shipping_fax01 > 0}-->
                                FAX：<!--{$shippingItem.shipping_fax01}-->-<!--{$shippingItem.shipping_fax02}-->-<!--{$shippingItem.shipping_fax03}--><br />
                            <!--{/if}-->
                            </small>
                        </div>
                        <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                        <div class="list-group-item">
                            <div class="row">
                                <div class="col-xs-6">
                                    <small><strong>お届け日：</strong><!--{$shippingItem.shipping_date|default:"指定なし"|h}--></small>
                                </div>
                                <div class="col-xs-6">
                                    <small><strong>お届け時間：</strong><!--{$shippingItem.shipping_time|default:"指定なし"|h}--></small>
                                </div>
                            </div>
                        </div>
                        <!--{/if}-->

                    <!--{if $is_multiple}-->
                        <div class="">
                            <!--{foreach item=item from=$shippingItem.shipment_item}-->
                                <div class="list-group-item clearfix">
                                    <div class="col-xs-3 col-sm-2 col-md-1 padding-none">
                                        <a
                                            <!--{if $item.productsClass.main_image|strlen >= 1}--> href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.productsClass.main_image|sfNoImageMainList|h}-->" class="expansion" target="_blank"
                                            <!--{/if}-->
                                        >
                                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.productsClass.main_list_image|sfNoImageMainList|h}-->" class="img-responsive" alt="<!--{$item.productsClass.name|h}-->" /></a>
                                    </div>
                                    <div class="col-xs-9 col-sm-10 col-md-11"><!--{* 商品名 *}--><strong><!--{$item.productsClass.name|h}--></strong><br />
                                        <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                            <!--{$item.productsClass.class_name1}-->：<!--{$item.productsClass.classcategory_name1}--><br />
                                        <!--{/if}-->
                                        <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                            <!--{$item.productsClass.class_name2}-->：<!--{$item.productsClass.classcategory_name2}-->
                                        <!--{/if}-->
                                    </div>
                                    <div class="col-xs-12 text-right padding-none">
                                        <div class="col-xs-4 col-xs-offset-3 col-sm-offset-5 col-md-offset-6 padding-none">
                                            <small>数量：</small><strong><!--{$item.quantity}--></strong>
                                        </div>
                                        <div class="col-xs-5 col-sm-3 col-md-2 padding-none">
                                            <small>小計：</small><strong><!--{$item.total_inctax|number_format}-->円</strong>
                                        </div>
                                    </div>
                                </div>
                            <!--{/foreach}-->
                        </div>
                    <!--{/if}-->

                    </div>
                </div><!--{* panel *}-->
            <!--{/foreach}-->
            <!--{* ▲お届け先 *}-->

            <h3 class="margin-top-xl margin-bottom-md">
                <span class="fa fa-arrow-circle-right"></span> 配送方法・お支払方法など
                <div class="pull-right">
                    <a href="./payment.php" class="btn btn-default btn-xs"><span class="fa fa-pencil"></span> 変更</a>
                </div>
            </h3>
            <div class="list-group">
                <div class="list-group-item">
                    <strong>配送方法：</strong><!--{$arrDeliv[$arrForm.deliv_id]|h}-->
                </div>
                <div class="list-group-item">
                    <strong>お支払方法：</strong><!--{$arrForm.payment_method|h}-->
                </div>
                <div class="list-group-item">
                    <strong>その他お問い合わせ：</strong><!--{$arrForm.message|h|nl2br}-->
                </div>
            </div>

            <div class="btn_area row">
                <div class="col-sm-3 padding-right-none hidden-xs">
                    <a href="./payment.php" class="btn btn-default btn-block">戻る</a>
                </div>
                <div class="col-sm-6">
                <!--{if $use_module}-->
                <button name="next" id="next" class="btn btn-primary btn-block xs-btn-lg sm-btn-lg">次へ</button>
                <!--{else}-->
                    <button name="next" id="next" class="btn btn-primary btn-block xs-btn-lg sm-btn-lg">ご注文確定</button>
                <!--{/if}-->
                </div>
                <div class="col-xs-12 visible-xs margin-top-sm">
                    <a href="./payment.php" class="btn btn-default btn-sm btn-block">戻る</a>
                </div>
            </div>
        </form>
    </div>
</div>
