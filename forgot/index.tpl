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
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="パスワードを忘れた方(入力ページ)"}-->

<div id="window_area">
    <h2>パスワードの再発行</h2>
    <p class="information">
        ご登録時のお名前とメールアドレスを入力して「次へ」ボタンをクリックしてください。
    </p>
    <form action="?" method="post" name="form1">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="mail_check" />

        <div id="forgot">
            <div class="contents">
                <div class="name form-group">
                    <div class="row">
                        <div class="col-xs-12">お名前</div>
                        <div class="col-xs-6<!--{if $arrErr.name01 or $errmsg}--> has-error<!--{/if}-->">
                            <input type="text" class="box120 form-control" name="name01" value="<!--{$arrForm.name01|default:''|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$errmsg|sfGetErrorColor}-->;<!--{$arrErr.name01|sfGetErrorColor}-->; ime-mode: active;" placeholder="姓" />
                            <p class="attention"><!--{$arrErr.name01}--></p>
                        </div>
                        <div class="col-xs-6<!--{if $arrErr.name02 or $errmsg}--> has-error<!--{/if}-->">
                            <input type="text" class="box120 form-control" name="name02" value="<!--{$arrForm.name02|default:''|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$errmsg|sfGetErrorColor}-->;<!--{$arrErr.name02|sfGetErrorColor}-->; ime-mode: active;" placeholder="名" />
                            <p class="attention"><!--{$arrErr.name02}--></p>
                        </div>
                    </div>
                </div>
                <div class="mailaddres form-group">
                    <div class="row">
                        <div class="col-xs-12">メールアドレス</div>
                        <div class="col-xs-12<!--{if $arrErr.email or $errmsg}--> has-error<!--{/if}-->">
                            <input type="email" name="email" value="<!--{$arrForm.email|default:$tpl_login_email|h}-->" class="box300 form-control" style="<!--{$errmsg|sfGetErrorColor}-->;<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="メールアドレス" />
                            <p class="attention"><!--{$arrErr.email}--></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <p class="attention">
            <!--{$errmsg}-->
        </p>
        <div class="btn_area row">
            <div class="col-sm-12 col-md-4">
                <button name="next" id="next" class="btn-action btn btn-primary btn-block xs-btn-lg sm-btn-lg">次へ</button>
            </div>
        </div>
    </form>
</div>
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->

