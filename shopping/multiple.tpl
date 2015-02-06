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
    <div id="undercolumn_shopping">
        <p class="flow_area">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`shopping/process/step1.tpl"}-->
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>
        <p class="information">各商品のお届け先を選択してください。<br />（※数量の合計は、カートの中の数量と合わせてください。）</p>
        <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
            <p>一覧にご希望の住所が無い場合は、新しいお届け先を追加登録してください。</p>
        <!--{/if}-->
        <p class="mini attention">※最大<!--{$smarty.const.DELIV_ADDR_MAX|h}-->件まで登録できます。</p>

        <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
            <p class="addbtn hidden-xs margin-bottom-lg">
                <a class="btn btn-warning btn-sm" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="eccube.openWindow('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->','new_deiv','600','640'); return false;">
                    新しいお届け先を追加する
                </a>
            </p>
            <div class="visible-xs row navbar navbar-default padding-top-sm margin-top-lg margin-bottom-lg padding-bottom-sm">
                <div class="col-xs-12">
                    <a class="btn btn-default btn-block btn-sm" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="eccube.openWindow('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->','new_deiv','600','640'); return false;">
                        新しいお届け先を追加する
                    </a>
                </div>
            </div>
        <!--{/if}-->
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
            <input type="hidden" name="line_of_num" value="<!--{$arrForm.line_of_num.value}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <!--{section name=line loop=$arrForm.line_of_num.value}-->
                <!--{assign var=index value=$smarty.section.line.index}-->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-9">
                                <div class="row">
                                    <div class="col-xs-4 col-md-3 padding-right-none">
                                        <a
                                            <!--{if $arrForm.main_image[$index]|strlen >= 1}--> href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrForm.main_image.value[$index]|sfNoImageMainList|h}-->" class="expansion" target="_blank"
                                            <!--{/if}-->
                                        >
                                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrForm.main_list_image.value[$index]|sfNoImageMainList|h}-->" class="img-responsive img-rounded" style="" alt="<!--{$arrForm.name.value[$index]|h}-->" />
                                        </a>
                                    </div>
                                    <div class="col-xs-8">
                                        <!--{* 商品名 *}--><strong><!--{$arrForm.name.value[$index]|h}--></strong><br />
                                        <!--{if $arrForm.classcategory_name1.value[$index] != ""}-->
                                            <!--{$arrForm.class_name1.value[$index]|h}-->：<!--{$arrForm.classcategory_name1.value[$index]|h}--><br />
                                        <!--{/if}-->
                                        <!--{if $arrForm.classcategory_name2.value[$index] != ""}-->
                                            <!--{$arrForm.class_name2.value[$index]|h}-->：<!--{$arrForm.classcategory_name2.value[$index]|h}--><br />
                                        <!--{/if}-->
                                        <!--{$arrForm.price_inctax.value[$index]|number_format}-->円
                                    </div>
                                </div>
                            </div>
                            <!--{assign var=key value="quantity"}-->
                            <div class="col-xs-3 text-center<!--{if $arrErr[$key][$index] != ''}--> has-error<!--{/if}-->">
                                <small>数量</small>
                                <input type="tel" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" class="box40 form-control" style="<!--{$arrErr[$key][$index]|sfGetErrorColor}-->" maxlength="<!--{$arrForm[$key].length}-->" />
                                <!--{if $arrErr[$key][$index] != ''}-->
                                    <small class="attention"><!--{$arrErr[$key][$index]}--></small>
                                <!--{/if}-->
                            </div>
                        </div>
                    </div>
                    <!--{assign var=key value="shipping"}-->
                    <div class="panel-footer<!--{if strlen($arrErr[$key][$index]) >= 1}--> has-error<!--{/if}-->">
                        <select class="form-control" name="<!--{$key}-->[<!--{$index}-->]" style="<!--{$arrErr[$key][$index]|sfGetErrorColor}-->">
                            <!--{html_options options=$addrs selected=$arrForm[$key].value[$index]}-->
                        </select>
                        <!--{if strlen($arrErr[$key][$index]) >= 1}-->
                            <div class="attention"><!--{$arrErr[$key][$index]}--></div>
                        <!--{/if}-->
<input type="hidden" name="cart_no[<!--{$index}-->]" value="<!--{$index}-->" />
                        <!--{assign var=key value="product_class_id"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="name"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="class_name1"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="class_name2"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="classcategory_name1"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="classcategory_name2"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="main_image"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="main_list_image"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="price"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="price_inctax"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                    </div>
                </div>
            <!--{/section}-->
            <div class="btn_area row">
                <div class="col-sm-3 padding-right-none hidden-xs">
                    <a href="<!--{$smarty.const.CART_URL}-->" class="btn btn-default btn-block">戻る</a>
                </div>
                <div class="col-sm-6">
                    <button name="send_button" id="send_button" class="btn btn-primary btn-block xs-btn-lg sm-btn-lg">選択したお届け先に送る</button>
                </div>
                <div class="col-xs-12 visible-xs margin-top-sm">
                    <a href="<!--{$smarty.const.CART_URL}-->" class="btn btn-default btn-sm btn-block">戻る</a>
                </div>
            </div>
        </form>
    </div>
</div>
