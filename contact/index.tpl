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

    <div id="undercolumn_contact">

        <div class="alert alert-warning">内容によっては回答をさしあげるのにお時間をいただくこともございます。<br />
        また、休業日は翌営業日以降の対応となりますのでご了承ください。</div>
        <div class="alert alert-info fade in">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <strong>必須項目</strong> 「<span class="attention">※</span>」印は入力必須項目です。
        </div>

        <form name="form1" id="form1" class="form-horizontal" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <div class="form-group">
                <label for="name01" class="col-sm-3 col-md-2 control-label">
                    お名前<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="row">
                        <div class="col-xs-6<!--{if $arrErr.name01}--> has-error<!--{/if}-->">
                            <input id="name01" type="text" class="box120 form-control" name="name01" value="<!--{$arrForm.name01.value|default:$arrData.name01|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->; ime-mode: active;" placeholder="姓" />
                            <span class="attention"><!--{$arrErr.name01}--></span>
                        </div>
                        <div class="col-xs-6<!--{if $arrErr.name02}--> has-error<!--{/if}-->">
                            <input type="text" class="box120 form-control" name="name02" value="<!--{$arrForm.name02.value|default:$arrData.name02|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->; ime-mode: active;" placeholder="名" />
                            <span class="attention"><!--{$arrErr.name02}--></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="kana01" class="col-sm-3 col-md-2 control-label">
                    フリガナ<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="row">
                        <div class="col-xs-6<!--{if $arrErr.kana01}--> has-error<!--{/if}-->">
                            <input type="text" id="kana01" class="box120 form-control" name="kana01" value="<!--{$arrForm.kana01.value|default:$arrData.kana01|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->; ime-mode: active;" placeholder="セイ" />
                            <span class="attention"><!--{$arrErr.kana01}--></span>
                        </div>
                        <div class="col-xs-6<!--{if $arrErr.kana02}--> has-error<!--{/if}-->">
                            <input type="text" class="box120 form-control" name="kana02" value="<!--{$arrForm.kana02.value|default:$arrData.kana02|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->; ime-mode: active;" placeholder="メイ" />
                            <span class="attention"><!--{$arrErr.kana02}--></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="zip01" class="col-sm-3 col-md-2 control-label">
                    郵便番号
                </label>
                <div class="top col-sm-9">
                    <div class="form-group">
                        <label class="control-label col-xs-1 padding-right-none">〒</label>
                        <div class="col-xs-3 col-sm-3 col-md-2<!--{if $arrErr.zip01}--> has-error<!--{/if}-->">
                            <input type="tel" name="zip01" id="zip01" class="box60 form-control padding-sm" value="<!--{$arrForm.zip01.value|default:$arrData.zip01|h}-->" maxlength="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr.zip01|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="123" />
                        </div>
                        <label class="control-label col-xs-1 padding-none">-</label>
                        <div class="col-xs-4 col-sm-4 col-md-3<!--{if $arrErr.zip02}--> has-error<!--{/if}-->">
                            <input type="tel" name="zip02" class="box60 form-control" value="<!--{$arrForm.zip02.value|default:$arrData.zip02|h}-->" maxlength="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip02|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="4567" />
                        </div>
                        <div class="col-xs-4 col-sm-4 padding-none">
                            <p class="top">
                                <a href="http://search.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">郵便番号検索</span></a>
                            </p>
                        </div>
                    </div>
                    <span class="attention"><!--{$arrErr.zip01}--><!--{$arrErr.zip02}--></span>
                    <p class="zipimg hidden-xs">
                        <a href="javascript:eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', 'zip01', 'zip02', 'pref', 'addr01');" class="btn btn-primary btn-xs">
                            住所自動入力
                        </a>
                        <span class="mini">&nbsp;郵便番号を入力後、クリックしてください。</span>
                    </p>
                    <div class="visible-xs">
                        <a href="javascript:eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', 'zip01', 'zip02', 'pref', 'addr01');" class="btn btn-default btn-block btn-sm">
                            郵便番号から住所自動入力
                        </a>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="pref" class="col-sm-3 col-md-2 control-label">
                    住所
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-xs-7 col-md-4<!--{if $arrErr.pref}--> has-error<!--{/if}-->">
                            <select id="pref" class="form-control" name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->">
                        <option value="">都道府県を選択</option><!--{html_options options=$arrPref selected=$arrForm.pref.value|default:$arrData.pref|h}--></select>
                        <span class="attention"><!--{$arrErr.pref}--></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12<!--{if $arrErr.addr01}--> has-error<!--{/if}-->">
                            <input type="text" class="box380 form-control" name="addr01" value="<!--{$arrForm.addr01.value|default:$arrData.addr01|h}-->" style="<!--{$arrErr.addr01|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->" />
                            <span class="attention"><!--{$arrErr.addr01}--></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12<!--{if $arrErr.addr02}--> has-error<!--{/if}-->">
                            <input type="text" class="box380 form-control" name="addr02" value="<!--{$arrForm.addr02.value|default:$arrData.addr02|h}-->" style="<!--{$arrErr.addr02|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->" />
                            <span class="attention"><!--{$arrErr.addr02}--></span>
                            <p class="mini help-block"><span class="attention">住所は2つに分けてご記入ください。マンション名は必ず記入してください。</span></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="tel01" class="col-sm-3 col-md-2 control-label">
                    電話番号
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-xs-3<!--{if $arrErr.tel01}--> has-error<!--{/if}-->">
                            <input type="tel" id="tel01" class="box60 form-control padding-xs" name="tel01" value="<!--{$arrForm.tel01.value|default:$arrData.tel01|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel01|sfGetErrorColor}-->; ime-mode: disabled;" />
                        </div>
                        <label class="control-label col-xs-1 padding-none">-</label>
                        <div class="col-xs-4<!--{if $arrErr.tel02}--> has-error<!--{/if}-->">
                            <input type="tel" class="box60 form-control" name="tel02" value="<!--{$arrForm.tel02.value|default:$arrData.tel02|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel02|sfGetErrorColor}-->; ime-mode: disabled;" />
                        </div>
                        <label class="control-label col-xs-1 padding-none">-</label>
                        <div class="col-xs-4<!--{if $arrErr.tel03}--> has-error<!--{/if}-->">
                            <input type="tel" class="box60 form-control" name="tel03" value="<!--{$arrForm.tel03.value|default:$arrData.tel03|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel03|sfGetErrorColor}-->; ime-mode: disabled;" />
                        </div>
                      </div>
                    <span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-3 col-md-2 control-label">
                    メールアドレス<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <!--{* ログインしていれば入力済みにする *}-->
                        <!--{if $smarty.server.REQUEST_METHOD != 'POST' && $smarty.session.customer}-->
                        <!--{assign var=email02 value=$arrData.email}-->
                        <!--{/if}-->
                        <div class="col-md-7<!--{if $arrErr.email}--> has-error<!--{/if}-->">
                            <input type="email" id="email" class="box380 top form-control" name="email" value="<!--{$arrForm.email.value|default:$arrData.email|h}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="user@domain.com" />
                            <span class="attention"><!--{$arrErr.email}--></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr.email02}--> has-error<!--{/if}-->">
                            <input type="email" class="box380 form-control" name="email02" value="<!--{$arrForm.email02.value|default:$email02|h}-->" style="<!--{$arrErr.email02|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="メールアドレス確認用" />
                            <span class="attention"><!--{$arrErr.email02}--></span>
                            <p class="mini help-block"><span class="attention">確認のため2度入力してください。</span></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="contents" class="col-sm-3 col-md-2 control-label">
                    お問い合わせ内容<span class="attention">※</span>
                </label>
                <div class="col-sm-9<!--{if $arrErr.contents}--> has-error<!--{/if}-->">
                            <textarea name="contents" id="contents" class="box380 form-control" rows="10" style="<!--{$arrErr.contents|h|sfGetErrorColor}-->; ime-mode: active;" placeholder="お問い合せ内容（全角<!--{$smarty.const.MLTEXT_LEN}-->字以下）"><!--{"\n"}--><!--{$arrForm.contents.value|h}--></textarea>
                            <span class="attention"><!--{$arrErr.contents}--></span>
                            <p class="mini attention help-block">※ご注文に関するお問い合わせには、必ず「ご注文番号」をご記入くださいますようお願いいたします。</p>
                </div>
            </div>
            <div class="btn_area form-group">
                <div class="col-sm-9 col-sm-push-3 col-md-4 col-md-push-2">
                    <button class="btn btn-primary btn-block xs-btn-lg sm-btn-lg">確認ページヘ</button>
                </div>
            </div>

        </form>
    </div>
</div>
