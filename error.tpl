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

<!--{strip}-->
    <div id="undercolumn">
        <div id="undercolumn_error">
            <div class="row">
                <div class="col-sm-10 col-sm-push-1">
                    <div class="message_area panel panel-default margin-top-lg">
                        <!--★エラーメッセージ-->
                        <p class="error panel-body text-center"><!--{$tpl_error}--></p>
                    </div>
                </div>
                <div class="col-sm-10 col-sm-push-1 col-md-4 col-md-push-4">
                    <div class="btn_area">
                        <!--{if $return_top}-->
                            <a href="<!--{$smarty.const.TOP_URL}-->" class="btn btn-default btn-block">トップページへ</a>
                        <!--{else}-->
                            <a href="javascript:history.back()" class="btn btn-default btn-block">戻る</a>
                        <!--{/if}-->
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--{/strip}-->
