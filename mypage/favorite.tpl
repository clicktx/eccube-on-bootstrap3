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
            <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
            <input type="hidden" name="mode" value="" />
            <input type="hidden" name="product_id" value="" />
            <h3><!--{$tpl_subtitle|h}--></h3>

            <!--{if $tpl_linemax > 0}-->

                <p><span class="attention"><!--{$tpl_linemax}-->件</span>のお気に入りがあります。</p>

                <div class="list-group">
                <!--{section name=cnt loop=$arrFavorite}-->
                    <!--{assign var=product_id value="`$arrFavorite[cnt].product_id`"}-->
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-xs-3 col-sm-2 col-md-1 padding-right-none">
                                <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$product_id|u}-->">
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrFavorite[cnt].main_list_image|sfNoImageMainList|h}-->" class="img img-responsive" alt="<!--{$arrFavorite[cnt].name|h}-->" />
                                </a>
                            </div>
                            <div class="col-xs-7 col-sm-8 col-md-9">
                                <div>
                                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$product_id|u}-->">
                                        <!--{$arrFavorite[cnt].name|h}--></a>
                                </div>
                                <div class="alignR sale_price">
                                    <span class="price">
                                        <!--{if $arrFavorite[cnt].price02_min_inctax == $arrFavorite[cnt].price02_max_inctax}-->
                                            <!--{$arrFavorite[cnt].price02_min_inctax|number_format}-->
                                        <!--{else}-->
                                            <!--{$arrFavorite[cnt].price02_min_inctax|number_format}-->～<!--{$arrFavorite[cnt].price02_max_inctax|number_format}-->
                                        <!--{/if}-->円</span>
                                </div>
                            </div>
                            <div class="col-xs-2 text-right">
                                <a class="btn-delete" href="javascript:eccube.setModeAndSubmit('delete_favorite','product_id','<!--{$product_id|h}-->');">
                                    <span class="fa fa-trash-o fa-lg"></span>
                                    <span class="hidden-xs hidden-sm">削除</span>
                                </a>
                            </div>
                        </div>
                    </div>
                <!--{/section}-->
                </div>

            <!--{else}-->
                <p class="alert alert-warning">お気に入りが登録されておりません。</p>
            <!--{/if}-->

                <div class="paging pagination hidden-xs">
                    <!--▼ページナビ-->
                    <!--{$tpl_strnavi}-->
                    <!--▲ページナビ-->
                </div>
                <!--{include file= "pager.tpl"}-->
        </form>
    </div>
</div>
