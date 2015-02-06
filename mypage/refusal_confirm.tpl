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
    <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="refusal_transactionid" value="<!--{$refusal_transactionid}-->" />
        <input type="hidden" name="mode" value="complete" />

        <div id="mycontents_area">
            <h3><!--{$tpl_subtitle|h}--></h3>
            <div id="complete_area">
                <div class="message">退会手続きを実行してもよろしいでしょうか？</div>
                <div class="message_area">
                    <p class="alert alert-danger">
                        <span class="fa fa-warning"></span>
                        退会手続きが完了した時点で、現在保存されている購入履歴やお届け先等の情報は全てなくなりますのでご注意ください。
                    </p>
                    <div class="btn_area row">
                        <div class="col-sm-7 padding-right-none hidden-xs">
                            <a href="./refusal.php" class="btn btn-default btn-block">いいえ、退会しません</a>
                        </div>
                        <div class="col-sm-5">
                            <button name="send_button" name="refuse_do" id="refuse_do" class="btn btn-danger btn-block">はい、退会します</button>
                        </div>
                        <div class="col-xs-12 visible-xs margin-top-sm">
                            <a href="./refusal.php" class="btn btn-default btn-lg btn-block">いいえ、退会しません</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
