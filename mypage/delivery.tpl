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
        <h3><!--{$tpl_subtitle|h}--></h3>
        <p class="inforamtion">登録住所以外への住所へ送付される場合等にご利用いただくことができます。<br />
        ※最大<span class="attention"><!--{$smarty.const.DELIV_ADDR_MAX|h}-->件</span>まで登録できます。</p>

        <!--{if $tpl_linemax < $smarty.const.DELIV_ADDR_MAX}-->
            <!--{* 退会時非表示 *}-->
            <!--{if $tpl_login}-->
                <div class="row padding-bottom-lg">
                    <div class="add_address col-xs-12 col-md-4">
                        <a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="eccube.openWindow('./delivery_addr.php','delivadd','600','640',{menubar:'no'}); return false;" target="_blank" class="btn btn-default btn-block">
                            新しいお届け先を追加
                        </a>
                    </div>
                </div>
            <!--{/if}-->
        <!--{/if}-->

        <!--{if $tpl_linemax > 0}-->
            <form name="form1" id="form1" method="post" action="?" >
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <input type="hidden" name="mode" value="" />
                <input type="hidden" name="other_deliv_id" value="" />
                <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />

                <div class="list-group">
                    <!--{section name=cnt loop=$arrOtherDeliv}-->
                        <!--{assign var=OtherPref value="`$arrOtherDeliv[cnt].pref`"}-->
                        <!--{assign var=OtherCountry value="`$arrOtherDeliv[cnt].country_id`"}-->
                        <div class="list-group-item">
                            <div class="row">
                                <div class="col-xs-7">
                                    <label for="add<!--{$smarty.section.cnt.iteration}-->">お届け先住所<!--{$smarty.section.cnt.iteration}--></label><br />
                                    <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
                                    <!--{$arrCountry[$OtherCountry]|h}--><br/>
                                    <!--{/if}-->
                                    〒<!--{$arrOtherDeliv[cnt].zip01}-->-<!--{$arrOtherDeliv[cnt].zip02}--><br />
                                    <!--{$arrPref[$OtherPref]|h}--><!--{$arrOtherDeliv[cnt].addr01|h}--><!--{$arrOtherDeliv[cnt].addr02|h}--><br />
                                    <!--{if $arrOtherDeliv[cnt].company_name}--><!--{$arrOtherDeliv[cnt].company_name|h}--><br /><!--{/if}-->
                                    <!--{$arrOtherDeliv[cnt].name01|h}-->&nbsp;<!--{$arrOtherDeliv[cnt].name02|h}-->
                                </div>
                                <div class="col-xs-5 padding-right-none text-right">
                                    <a href="./delivery_addr.php" onclick="eccube.openWindow('./delivery_addr.php?other_deliv_id=<!--{$arrOtherDeliv[cnt].other_deliv_id}-->','deliv_disp','600','640'); return false;" class="btn btn-default btn-xs">変更</a>
                                    <a href="#" onclick="eccube.setModeAndSubmit('delete','other_deliv_id','<!--{$arrOtherDeliv[cnt].other_deliv_id}-->'); return false;" class="btn btn-delete">
                                        <span class="fa fa-times-circle fa-lg"></span>
                                        <span class="hidden-xs">削除</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    <!--{/section}-->
                </div>

            </form>
        <!--{else}-->
            <p class="delivempty alert alert-info"><strong>登録済みのお届け先はありません。</strong></p>
        <!--{/if}-->
    </div>
</div>
