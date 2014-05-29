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
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="お客様の声書き込み（入力ページ）"}-->

<div id="window_area">
    <h2 class="title">商品レビューの投稿</h2>
    <div class="panel-body">
        <p class="windowtext">以下の商品について、お客様のご意見、ご感想をどしどしお寄せください。<br />
            ご入力後、一番下の「確認ページへ」ボタンをクリックしてください。</p>
        <div class="alert alert-info fade in">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <strong>必須項目</strong> 「<span class="attention">※</span>」印は入力必須項目です。
        </div>
        <h3 class="page-header">商品名「<!--{$arrForm.name|h}-->」</h3>
        <form class="form-horizontal" role="form" name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="product_id" value="<!--{$arrForm.product_id|h}-->" />
            <div class="form-group<!--{if $arrErr.reviewer_name}--> has-error<!--{/if}-->">
                <label for="reviewer_name" class="col-sm-3 control-label">投稿者名<span class="attention">※</span></label>
                <div class="col-sm-8">
                    <input type="text" id="reviewer_name" name="reviewer_name" value="<!--{$arrForm.reviewer_name|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.reviewer_name|sfGetErrorColor}-->" class="box350 form-control" />
                    <span class="attention"><!--{$arrErr.reviewer_name}--></span>
                </div>
            </div>
            <div class="form-group<!--{if $arrErr.reviewer_url}--> has-error<!--{/if}-->">
                <label for="reviewer_url" class="col-sm-3 control-label">投稿者URL</label>
                <div class="col-sm-8">
                    <input type="text" id="reviewer_url" name="reviewer_url" value="<!--{$arrForm.reviewer_url|h}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" style="<!--{$arrErr.reviewer_url|sfGetErrorColor}-->" class="box350 form-control" />
                    <span class="attention"><!--{$arrErr.reviewer_url}--></span>
                </div>
            </div>
            <div class="form-group">
                <label for="man" class="col-sm-3 control-label">性別</label>
                <div class="col-sm-8">
                    <input type="radio" name="sex" id="man" value="1" <!--{if $arrForm.sex eq 1}--> checked="checked"<!--{/if}--> /><label for="man">&nbsp;男性</label>&nbsp;
                    <input type="radio" name="sex" id="woman" value="2" <!--{if $arrForm.sex eq 2}--> checked="checked"<!--{/if}--> /><label for="woman">&nbsp;女性</label>
                </div>
            </div>
            <div class="form-group<!--{if $arrErr.recommend_level}--> has-error<!--{/if}-->">
                <label for="recommend_level" class="col-sm-3 control-label">おすすめレベル<span class="attention">※</span></label>
                <div class="col-sm-8">
                    <select id="recommend_level" name="recommend_level" style="<!--{$arrErr.recommend_level|sfGetErrorColor}-->" class="form-control">
                        <option value="" selected="selected">選択してください</option>
                            <!--{html_options options=$arrRECOMMEND selected=$arrForm.recommend_level}-->
                    </select>
                    <span class="attention"><!--{$arrErr.recommend_level}--></span>
                </div>
            </div>
            <div class="form-group<!--{if $arrErr.title}--> has-error<!--{/if}-->">
                <label for="title" class="col-sm-3 control-label">タイトル<span class="attention">※</span></label>
                <div class="col-sm-8">
                    <input type="text" id="title" name="title" value="<!--{$arrForm.title|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.title|sfGetErrorColor}-->" class="box350 form-control" />
                    <span class="attention"><!--{$arrErr.title}--></span>
                </div>
            </div>
            <div class="form-group<!--{if $arrErr.comment}--> has-error<!--{/if}-->">
                <label for="comment" class="col-sm-3 control-label">コメント<span class="attention">※</span></label>
                <div class="col-sm-8">
                    <textarea id="comment" name="comment" cols="50" rows="10" style="<!--{$arrErr.comment|sfGetErrorColor}-->" class="area350 form-control"><!--{"\n"}--><!--{$arrForm.comment|h}--></textarea>
                    <span class="attention"><!--{$arrErr.comment}--></span>
                </div>
            </div>
            <div class="form-group">
                <div class="btn_area col-sm-4 col-sm-offset-3">
                    <button class="btn btn-primary btn-block">確認ページへ</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->
