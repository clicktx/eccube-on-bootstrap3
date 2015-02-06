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
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="パスワードを忘れた方(確認ページ)"}-->

<div id="window_area">
    <h2>パスワードの再発行 秘密の質問の確認</h2>
    <p class="information">
        ご登録時に入力した下記質問の答えを入力して「次へ」ボタンをクリックしてください。<br />
        ※下記質問の答えをお忘れになられた場合は、<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentitiy'}--></a>までご連絡ください。<br />
    </p>
    <p class="message alert alert-danger">
        <span class="fa fa-warning"></span>
        【重要】新しくパスワードを発行いたしますので、お忘れになったパスワードはご利用できなくなります。</p>
    </p>
    <form action="?" method="post" name="form1">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="secret_check" />

        <!--{foreach key=key item=item from=$arrForm}-->
            <!--{if $key ne 'reminder_answer'}-->
                <input type="hidden" name="<!--{$key}-->" value="<!--{$item|h}-->" />
            <!--{/if}-->
        <!--{/foreach}-->

        <div id="completebox" class="row">
            <div class="col-xs-12">
                <!--{$arrReminder[$arrForm.reminder]}--><!--★答え入力★-->
            </div>
            <div class="col-xs-12<!--{if $arrErr.reminder or $arrErr.reminder_answer or $errmsg}--> has-error<!--{/if}-->">
                <input type="text" name="reminder_answer" value="" class="box300 form-control" style="<!--{$arrErr.reminder_answer|sfGetErrorColor}--><!--{$errmsg|sfGetErrorColor}-->" />
                <span class="attention">
                    <!--{$errmsg}-->
                    <!--{$arrErr.reminder}-->
                    <!--{$arrErr.reminder_answer}-->
                </span>
            </div>
        </div>
        <div class="btn_area row">
            <div class="col-sm-12 col-md-4">
                <button name="next" id="next" class="btn-action btn btn-primary btn-block xs-btn-lg sm-btn-lg">パスワードを再発行</button>
            </div>
        </div>
    </form>
</div>

<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->
