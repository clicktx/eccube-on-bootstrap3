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
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="お客様の声書き込み（確認ページ）"}-->

<div id="window_area">
    <h2 class="title">商品レビューの投稿</h2>
    <div class="panel-body">
        <form name="form1" id="form1" class="form" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="complete" />
            <!--{foreach from=$arrForm key=key item=item}-->
                <!--{if $key ne "mode"}-->
                    <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item|h}-->" />
                <!--{/if}-->
            <!--{/foreach}-->

            <table class="table" summary="お客様の声書き込み">
                <col width="30%" />
                <col width="70%" />
                <tr>
                    <th>商品名</th>
                    <td><!--{$arrForm.name|h}--></td>
                </tr>
                <tr>
                    <th>投稿者名</th>
                    <td><!--{$arrForm.reviewer_name|h}--></td>
                </tr>
                <tr>
                    <th>投稿者URL</th>
                    <td><!--{$arrForm.reviewer_url|h}--></td>
                </tr>
                <tr>
                    <th>性別</th>
                    <td><!--{if $arrForm.sex eq 1}-->男性<!--{elseif $arrForm.sex eq 2}-->女性<!--{/if}--></td>
                </tr>
                <tr>
                    <th>おすすめレベル</th>
                    <td><span class="recommend_level"><!--{$arrRECOMMEND[$arrForm.recommend_level]}--></span></td>
                </tr>
                <tr>
                    <th>タイトル</th>
                    <td><!--{$arrForm.title|h}--></td>
                </tr>
                <tr>
                    <th>コメント</th>
                    <td><!--{$arrForm.comment|h|nl2br}--></td>
                </tr>
            </table>
            <div class="btn_area margin-top-lg ">
                <button id="back" class="btn btn-default col-xs-4 col-sm-3 margin-left-sm" onclick="mode.value='return';">戻る</button>
                <button id="send" class="btn btn-primary col-xs-6 col-sm-5 margin-left-sm">完了ページヘ</button>
            </div>
        </form>
    </div>
</div>
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->
