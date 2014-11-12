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
    <!--{if $tpl_navi != ""}-->
        <!--{include file=$tpl_navi}-->
    <!--{else}-->
        <!--{include file=`$smarty.const.TEMPLATE_REALDIR`mypage/navi.tpl}-->
    <!--{/if}-->
    <div id="mycontents_area">
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="order_id" value="" />
            <input type="hidden" name="pageno" value="<!--{$objNavi->nowpage}-->" />
            <h3><!--{$tpl_subtitle|h}--></h3>

            <!--{if $objNavi->all_row > 0}-->

                <p><span class="attention"><!--{$objNavi->all_row}-->件</span>の購入履歴があります。</p>

                <div class="list-group">
                    <!--{section name=cnt loop=$arrOrder}-->
                        <a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$arrOrder[cnt].order_id}-->" class="list-group-item">
                            <div><strong>注文番号：</strong><!--{$arrOrder[cnt].order_id}--></div>
                            <div class=""><strong>購入日時：</strong><!--{$arrOrder[cnt].create_date|sfDispDBDate}--></div>
                            <!--{assign var=payment_id value="`$arrOrder[cnt].payment_id`"}-->
                            <div class=""><strong>お支払い方法：</strong><!--{$arrPayment[$payment_id]|h}--></div>
                            <div class=""><strong>合計金額：</strong><!--{$arrOrder[cnt].payment_total|number_format}-->円</div>

                            <!--{if $smarty.const.MYPAGE_ORDER_STATUS_DISP_FLAG }-->
                                <!--{assign var=order_status_id value="`$arrOrder[cnt].status`"}-->
                                <div class=""><strong>ご注文状況：</strong>
                                    <!--{if $order_status_id != $smarty.const.ORDER_PENDING }-->
                                        <!--{$arrCustomerOrderStatus[$order_status_id]|h}-->
                                    <!--{else}-->
                                        <span class="attention"><!--{$arrCustomerOrderStatus[$order_status_id]|h}--></span>
                                    <!--{/if}-->
                                </div>
                            <!--{/if}-->
                            <div class="btn-arrow">
                                <span class="fa fa-angle-right"></span>
                            </div>
                        </a>
                    <!--{/section}-->
                </div>
                <div class="pagenumber_area navi pagination">
                    <!--▼ページナビ-->
                    <!--{$objNavi->strnavi}-->
                    <!--▲ページナビ-->
                </div>

            <!--{else}-->
                <p>購入履歴はありません。</p>
            <!--{/if}-->
        </form>
    </div>
</div>
