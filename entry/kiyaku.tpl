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
    <div id="undercolumn_entry">
        <h2 class="title"><!--{$tpl_title|h}--></h2>
        <div class="col-sm-12 margin-bottom-lg">
            <p class="message alert alert-warning">【重要】 会員登録をされる前に、下記ご利用規約をよくお読みください。</p>
            <p class="margin-bottom-xl">規約には、本サービスを使用するに当たってのあなたの権利と義務が規定されております。<br />
                「同意して会員登録へ」ボタンをクリックすると、あなたが本規約の全ての条件に同意したことになります。
            </p>
            <pre class="padding-md">
                <!--{"\n"}--><!--{$tpl_kiyaku_text|h}-->
            </pre>
        </div>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <div class="btn_area padding-md">
                <div class="jumbotron padding-md col-sm-12">
                    <div class="col-sm-6 margin-bottom-sm">
                        <a href="<!--{$smarty.const.TOP_URL}-->" class="btn btn-default btn-block">同意しない</a>
                    </div>
                    <div class="col-sm-6">
                        <a href="<!--{$smarty.const.ENTRY_URL}-->" class="btn btn-success btn-block xs-btn-lg sm-btn-lg">同意して会員登録へ</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
