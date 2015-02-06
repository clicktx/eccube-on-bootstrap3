<!--{*
/*
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
 */
*}-->

<div id="mypagecolumn">
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <!--{include file=$tpl_navi}-->
    <div id="mycontents_area">
        <!--{if $is_price_change == true}-->
            <div class="attention alert alert-danger fade in">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <span class="fa fa-warning"></span>
              金額が変更されている商品があるため、再注文時はご注意ください。
            </div>
        <!--{/if}-->
        <h3><!--{$tpl_subtitle|h}--></h3>
        <div class="mycondition_area">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="st">注文番号：&nbsp;</span><!--{$tpl_arrOrderData.order_id}-->
                </div>
                <div class="list-group">
                    <div class="list-group-item">
                        <span class="st">購入日時：&nbsp;</span><!--{$tpl_arrOrderData.create_date|sfDispDBDate}--><br />
                        <span class="st">お支払い方法：&nbsp;</span><!--{$arrPayment[$tpl_arrOrderData.payment_id]|h}--><br />
                        <!--{if $smarty.const.MYPAGE_ORDER_STATUS_DISP_FLAG}-->
                            <span class="st">ご注文状況：&nbsp;</span>
                            <!--{if $tpl_arrOrderData.status != $smarty.const.ORDER_PENDING}-->
                                <!--{$arrCustomerOrderStatus[$tpl_arrOrderData.status]|h}-->
                            <!--{else}-->
                                <span class="attention"><!--{$arrCustomerOrderStatus[$tpl_arrOrderData.status]|h}--></span>
                            <!--{/if}-->
                        <!--{/if}-->
                    </div>
                    <div class="list-group-item">
                    <!--{foreach from=$tpl_arrOrderDetail item=orderDetail}-->
                        <div class="row history-item">
                            <div class="col-xs-3 col-sm-2 col-md-1 padding-right-none">
                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$orderDetail.main_list_image|sfNoImageMainList|h}-->" class="img-responsive" alt="<!--{$orderDetail.product_name|h}-->" />
                            </div>
                            <div class="col-xs-9 col-sm-10 col-md-11">
                                <div class="history-item-title">
                                    <a<!--{if $orderDetail.enable}--> href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$orderDetail.product_id|u}-->"<!--{/if}--> class="text-bold"><!--{$orderDetail.product_name|h}-->
                                    </a><br />
                                    <small>
                                        <!--{if $orderDetail.classcategory_name1 != ""}-->
                                            <!--{$orderDetail.classcategory_name1|h}-->
                                        <!--{/if}-->
                                        <!--{if $orderDetail.classcategory_name2 != ""}-->
                                            / <!--{$orderDetail.classcategory_name2|h}-->
                                        <!--{/if}-->
                                    </small>
                                </div>
                                <div class="history-item-price">
                                    <small>価格：</small><!--{$orderDetail.price_inctax|number_format|h}-->円
                                <!--{if $orderDetail.price_inctax != $orderDetail.product_price_inctax}-->
                                    <div class="attention"><small>現在価格：</small><!--{$orderDetail.product_price_inctax|number_format|h}-->円</div>
                                <!--{/if}-->
                                </div>
                                <div>
                                <!--{if $orderDetail.product_type_id == $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                                    <!--{if $orderDetail.is_downloadable}-->
                                        <a target="_self" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/download.php?order_id=<!--{$tpl_arrOrderData.order_id}-->&product_id=<!--{$orderDetail.product_id}-->&product_class_id=<!--{$orderDetail.product_class_id}-->" class="btn btn-default margin-sm">ダウンロード</a>
                                    <!--{else}-->
                                        <a href="#" class="btn btn-default margin-sm" disabled="disabled">
                                            ダウンロード
                                            <!--{if $orderDetail.payment_date == "" && $orderDetail.effective == "0"}-->
                                                <br />（入金確認中）
                                            <!--{else}-->
                                                <br />（期限切れ）
                                            <!--{/if}-->
                                        </a>
                                    <!--{/if}-->
                                <!--{/if}-->
                                </div>
                                <div class="text-right history-item-subtotal">
                                    <span class="padding-right-lg">
                                        <small>数量：</small><!--{$orderDetail.quantity|h}-->
                                    </span>
                                    <span>
                                        <small>小計：</small><!--{$orderDetail.price_inctax|sfMultiply:$orderDetail.quantity|number_format}-->円
                                    </span>
                                </div>
                            </div>
                        </div>
                    <!--{/foreach}-->
                    </div>
                </div>
                <div class="panel-footer text-right">
                    <div><small>小計：</small><!--{$tpl_arrOrderData.subtotal|number_format}-->円</div>
                    <!--{assign var=point_discount value="`$tpl_arrOrderData.use_point*$smarty.const.POINT_VALUE`"}-->
                    <!--{if $point_discount > 0}-->
                        <div><small>ポイント値引き：</small>&minus;<!--{$point_discount|number_format}-->円</div>
                    <!--{/if}-->
                    <!--{assign var=key value="discount"}-->
                    <!--{if $tpl_arrOrderData[$key] != "" && $tpl_arrOrderData[$key] > 0}-->
                        <div><small>値引き：</small>&minus;<!--{$tpl_arrOrderData[$key]|number_format}-->円</div>
                    <!--{/if}-->
                    <div><small>送料：</small><!--{assign var=key value="deliv_fee"}--><!--{$tpl_arrOrderData[$key]|number_format|h}-->円</div>
                    <!--{assign var=key value="charge"}-->
                    <div><small>手数料：</small><!--{$tpl_arrOrderData[$key]|number_format|h}-->円</div>
                    <div><small>合計：</small><span class="price text-bold"><!--{$tpl_arrOrderData.payment_total|number_format}-->円</span></div>

                <!-- 使用ポイントここから -->
                <!--{if $smarty.const.USE_POINT !== false}-->
                    <div><small>ご使用ポイント：</small><!--{assign var=key value="use_point"}--><!--{$tpl_arrOrderData[$key]|number_format|default:0}--> pt</div>
                    <div><small>今回加算されるポイント：</small><!--{$tpl_arrOrderData.add_point|number_format|default:0}--> pt</div>
                <!--{/if}-->
                <!-- 使用ポイントここまで -->
                </div>
            </div>

            <form action="order.php" method="post" class="margin-bottom-xl">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <input type="hidden" name="order_id" value="<!--{$tpl_arrOrderData.order_id|h}-->" />
                <div class="row">
                    <div class="col-md-4">
                        <button class="btn btn-primary btn-block" name="submit">再注文</button>
                    </div>
                </div>
            </form>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong>メール配信履歴一覧</strong>
                </div>
                <div class="list-group">
                    <!--{section name=cnt loop=$tpl_arrMailHistory}-->
                    <a href="#" class="list-group-item" onclick="eccube.openWindow('./mail_view.php?send_id=<!--{$tpl_arrMailHistory[cnt].send_id}-->','mail_view','650','800'); return false;">
                        <div class="padding-right-sm">
                            <div>配信日：<!--{$tpl_arrMailHistory[cnt].send_date|sfDispDBDate|h}--></div>
                            <!--{assign var=key value="`$tpl_arrMailHistory[cnt].template_id`"}-->
                            <div>通知メール：<!--{$arrMAILTEMPLATE[$key]|h}--></div>
                            <div class="text-bold"><!--{$tpl_arrMailHistory[cnt].subject|h}--></div>
                        </div>
                        <div class="btn-arrow">
                            <span class="fa fa-angle-right"></span>
                        </div>
                    </a>
                    <!--{/section}-->
                </div>
            </div>
        </div>

        <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <strong>お届け先<!--{if $isMultiple}--><!--{$smarty.foreach.shippingItem.iteration}--><!--{/if}--></strong>
            </div>
            <div class="list-group">
            <!--{if $isMultiple}-->
                <div class="list-group-item">
                    <!--{foreach item=item from=$shippingItem.shipment_item}-->
                        <div><strong>商品コード：</strong><!--{$item.productsClass.product_code|h}--></div>
                        <div><strong>商品名：</strong><!--{$item.productsClass.name|h}--><br />
                            <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                <!--{$item.productsClass.class_name1}-->：<!--{$item.productsClass.classcategory_name1}--><br />
                            <!--{/if}-->
                            <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                <!--{$item.productsClass.class_name2}-->：<!--{$item.productsClass.classcategory_name2}-->
                            <!--{/if}-->
                        </div>
                        <div>
                            <strong>単価：</strong>
                            <!--{$item.price|sfCalcIncTax:$tpl_arrOrderData.order_tax_rate:$tpl_arrOrderData.order_tax_rule|number_format}-->円
                        </div>
                        <div><strong>数量：</strong><!--{$item.quantity}--></div>
                        <!--{* XXX 購入小計と誤差が出るためコメントアウト
                        <div><!--{$item.total_inctax|number_format}-->円</div>
                        *}-->
                    <!--{/foreach}-->
                </div>
            <!--{/if}-->
                <div class="list-group-item">
                    <div><strong>お名前：</strong><!--{$shippingItem.shipping_name01|h}-->&nbsp;<!--{$shippingItem.shipping_name02|h}--></div>
                    <div><strong>フリガナ：</strong><!--{$shippingItem.shipping_kana01|h}-->&nbsp;<!--{$shippingItem.shipping_kana02|h}--></div>
                    <div><strong>会社名：</strong><!--{$shippingItem.shipping_company_name|h}--></div>
                <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
                    <div><strong>国：</strong><!--{$arrCountry[$shippingItem.shipping_country_id]|h}--></div>
                    <div><strong>ZIPCODE：</strong><!--{$shippingItem.shipping_zipcode|h}--></div>
                <!--{/if}-->
                    <div><strong>郵便番号：</strong>〒<!--{$shippingItem.shipping_zip01}-->-<!--{$shippingItem.shipping_zip02}--></div>
                    <div><strong>住所：</strong><!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01|h}--><!--{$shippingItem.shipping_addr02|h}--></div>
                    <div><strong>電話番号：</strong><!--{$shippingItem.shipping_tel01}-->-<!--{$shippingItem.shipping_tel02}-->-<!--{$shippingItem.shipping_tel03}--></div>
                    <div><strong>FAX番号：</strong>
                        <!--{if $shippingItem.shipping_fax01 > 0}-->
                            <!--{$shippingItem.shipping_fax01}-->-<!--{$shippingItem.shipping_fax02}-->-<!--{$shippingItem.shipping_fax03}-->
                        <!--{/if}-->
                    </div>
                    <div><strong>お届け日：</strong><!--{$shippingItem.shipping_date|default:'指定なし'|h}--></div>
                    <div><strong>お届け時間：</strong><!--{$shippingItem.shipping_time|default:'指定なし'|h}--></div>
                </div>
            </div>
        </div>
        <!--{/foreach}-->

        <div class="btn_area row">
            <div class="col-md-4">
                <a href="./<!--{$smarty.const.DIR_INDEX_PATH}-->" class="btn btn-default btn-block">購入履歴一覧に戻る</a>
            </div>
        </div>

    </div>
</div>
