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
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <div id="undercolumn_contact col-sm-12">
        <p class="margin-bottom-lg">下記入力内容で送信してもよろしいでしょうか？<br />
            よろしければ、一番下の「送信する」ボタンをクリックしてください。</p>
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="complete" />
            <!--{foreach key=key item=item from=$arrForm}-->
                <!--{if $key ne 'mode'}-->
                    <input type="hidden" name="<!--{$key}-->" value="<!--{$item.value|h}-->" />
                <!--{/if}-->
            <!--{/foreach}-->
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <table summary="お問い合わせ内容確認" class="table table-bordered">
                        <col width="30%" />
                        <col width="70%" />
                        <tr>
                            <th>お名前</th>
                            <td><!--{$arrForm.name01.value|h}-->　<!--{$arrForm.name02.value|h}--></td>
                        </tr>
                        <tr>
                            <th>お名前(フリガナ)</th>
                            <td><!--{$arrForm.kana01.value|h}-->　<!--{$arrForm.kana02.value|h}--></td>
                        </tr>
                        <tr>
                            <th>郵便番号</th>
                            <td>
                                <!--{if strlen($arrForm.zip01.value) > 0 && strlen($arrForm.zip02.value) > 0}-->
                                    〒<!--{$arrForm.zip01.value|h}-->-<!--{$arrForm.zip02.value|h}-->
                                <!--{/if}-->
                            </td>
                        </tr>
                        <tr>
                            <th>住所</th>
                            <td><!--{$arrPref[$arrForm.pref.value]}--><!--{$arrForm.addr01.value|h}--><!--{$arrForm.addr02.value|h}--></td>
                        </tr>
                        <tr>
                            <th>電話番号</th>
                            <td>
                                <!--{if strlen($arrForm.tel01.value) > 0 && strlen($arrForm.tel02.value) > 0 && strlen($arrForm.tel03.value) > 0}-->
                                    <!--{$arrForm.tel01.value|h}-->-<!--{$arrForm.tel02.value|h}-->-<!--{$arrForm.tel03.value|h}-->
                                <!--{/if}-->
                            </td>
                        </tr>
                        <tr>
                            <th>メールアドレス</th>
                            <td><a href="mailto:<!--{$arrForm.email.value|escape:'hex'}-->"><!--{$arrForm.email.value|escape:'hexentity'}--></a></td>
                        </tr>
                        <tr>
                            <th>お問い合わせ内容</th>
                            <td><!--{$arrForm.contents.value|h|nl2br}--></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="btn_area row padding-left-md padding-right-md">
                <div class="col-sm-3 padding-right-none hidden-xs">
                    <a href="?" onclick="eccube.setModeAndSubmit('return', '', ''); return false;" class="btn btn-default btn-block">戻る</a>
                </div>
                <div class="col-sm-6">
                    <button name="send_button" id="send_button" class="btn btn-primary btn-block xs-btn-lg sm-btn-lg">送信する</button>
                </div>
                <div class="col-xs-12 visible-xs margin-top-sm">
                    <a href="?" onclick="eccube.setModeAndSubmit('return', '', ''); return false;" class="btn btn-default btn-sm btn-block">戻る</a>
                </div>
            </div>

        </form>
    </div>
</div>
