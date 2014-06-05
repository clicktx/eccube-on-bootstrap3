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

<!--{strip}-->
            <!--{assign var=errCnt value=0}-->
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`name01"}-->
                <!--{assign var=key2 value="`$prefix`name02"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    お名前<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="row">
                        <div class="col-xs-6<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <input id="<!--{$key1}-->" type="text" class="box120 form-control" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: active;" placeholder="姓" />
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                        </div>
                        <div class="col-xs-6<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
                            <input type="text" class="box120 form-control" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: active;" placeholder="名" />
                            <span class="attention"><!--{$arrErr[$key2]}--></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`kana01"}-->
                <!--{assign var=key2 value="`$prefix`kana02"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    フリガナ<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="row">
                        <div class="col-xs-6<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <input type="text" id="<!--{$key1}-->" class="box120 form-control" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: active;" placeholder="セイ" />
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                        </div>
                        <div class="col-xs-6<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
                            <input type="text" class="box120 form-control" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: active;" placeholder="メイ" />
                            <span class="attention"><!--{$arrErr[$key2]}--></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`company_name"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    会社名
                </label>
                <div class="col-sm-9<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                    <input type="text" id="<!--{$key1}-->" class="box300 form-control" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: active;" placeholder="会社名　部署名" />
                    <span class="attention"><!--{$arrErr[$key1]}--></span>
                </div>
            </div>
            <!--{assign var=key1 value="`$prefix`zip01"}-->
            <!--{assign var=key2 value="`$prefix`zip02"}-->
            <!--{assign var=key3 value="`$prefix`pref"}-->
            <!--{assign var=key4 value="`$prefix`addr01"}-->
            <!--{assign var=key5 value="`$prefix`addr02"}-->
            <!--{assign var=key6 value="`$prefix`country_id"}-->
            <!--{assign var=key7 value="`$prefix`zipcode"}-->
            <!--{if !$smarty.const.FORM_COUNTRY_ENABLE}-->
                <input type="hidden" name="<!--{$key6}-->" value="<!--{$smarty.const.DEFAULT_COUNTRY_ID}-->" />
            <!--{else}-->
            <div class="form-group">
                <label for="<!--{$key6}-->" class="col-sm-3 col-md-2 control-label">
                    国<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-xs-7 col-md-4<!--{if $arrErr[$key6]}--> has-error<!--{/if}-->">
                            <select class="form-control" name="<!--{$key6}-->" style="<!--{$arrErr[$key6]|sfGetErrorColor}-->">
                                <option value="" selected="selected">国を選択</option>
                                <!--{html_options options=$arrCountry selected=$arrForm[$key6].value|h|default:$smarty.const.DEFAULT_COUNTRY_ID}-->
                            </select>
                            <span class="attention"><!--{$arrErr[$key6]}--></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="<!--{$key7}-->" class="col-sm-3 col-md-2 control-label">
                    ZIP CODE
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-xs-7 col-md-4<!--{if $arrErr[$key7]}--> has-error<!--{/if}-->">
                            <input type="text" class="box120 form-control" name="<!--{$key7}-->" value="<!--{$arrForm[$key7].value|h}-->" maxlength="<!--{$arrForm[$key7].length}-->" style="<!--{$arrErr[$key7]|sfGetErrorColor}-->; ime-mode: disabled;" />
                            <span class="attention"><!--{$arrErr[$key7]}--></span>
                        </div>
                    </div>
                </div>
            </div>
            <!--{/if}-->
            <div class="form-group">
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    郵便番号<span class="attention">※</span>
                </label>
                <div class="top col-sm-9">
                    <div class="form-group">
                        <label class="control-label col-xs-1 padding-right-none">〒</label>
                        <div class="col-xs-3 col-sm-3 col-md-2<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <input type="tel" id="<!--{$key1}-->" class="box60 form-control padding-sm" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="123" />
                        </div>
                        <label class="control-label col-xs-1 padding-none">-</label>
                        <div class="col-xs-4 col-sm-4 col-md-3<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
                            <input type="tel" class="box60 form-control padding-sm" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="4567" />
                        </div>
                        <div class="col-xs-4 col-sm-4 padding-none">
                            <p class="top">
                                <a href="http://search.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">郵便番号検索</span></a>
                            </p>
                        </div>
                    </div>
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                    <p class="zipimg hidden-xs">
                        <a href="javascript:eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->');" class="btn btn-primary btn-xs">
                            住所自動入力
                        </a>
                        <span class="mini">&nbsp;郵便番号を入力後、クリックしてください。</span>
                    </p>
                    <div class="visible-xs">
                        <a href="javascript:eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->');" class="btn btn-default btn-block btn-sm">
                            郵便番号から住所自動入力
                        </a>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="<!--{$key3}-->" class="col-sm-3 col-md-2 control-label">
                    住所<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-xs-7 col-md-4<!--{if $arrErr[$key3]}--> has-error<!--{/if}-->">
                            <select id="<!--{$key3}-->" class="form-control" name="<!--{$key3}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->">
                                <option value="">都道府県を選択</option>
                                <!--{html_options options=$arrPref selected=$arrForm[$key3].value|h}-->
                            </select>
                        <span class="attention"><!--{$arrErr[$key3]}--></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12<!--{if $arrErr[$key4]}--> has-error<!--{/if}-->">
                            <input type="text" class="box380 form-control" name="<!--{$key4}-->" value="<!--{$arrForm[$key4].value|h}-->" style="<!--{$arrErr[$key4]|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->" />
                            <span class="attention"><!--{$arrErr[$key4]}--></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12<!--{if $arrErr[$key5]}--> has-error<!--{/if}-->">
                            <input type="text" class="box380 form-control" name="<!--{$key5}-->" value="<!--{$arrForm[$key5].value|h}-->" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->" />
                            <span class="attention"><!--{$arrErr[$key5]}--></span>
                            <p class="mini help-block"><span class="attention">住所は2つに分けてご記入ください。マンション名は必ず記入してください。</span></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`tel01"}-->
                <!--{assign var=key2 value="`$prefix`tel02"}-->
                <!--{assign var=key3 value="`$prefix`tel03"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    電話番号<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-xs-3<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <input type="tel" id="<!--{$key1}-->" class="box60 form-control padding-xs" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" />
                        </div>
                        <label class="control-label col-xs-1 padding-none">-</label>
                        <div class="col-xs-4<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
                            <input type="tel" class="box60 form-control" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" />
                        </div>
                        <label class="control-label col-xs-1 padding-none">-</label>
                        <div class="col-xs-4<!--{if $arrErr[$key3]}--> has-error<!--{/if}-->">
                            <input type="tel" class="box60 form-control" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|h}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->; ime-mode: disabled;" />
                        </div>
                      </div>
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></span>
                </div>
            </div>
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`fax01"}-->
                <!--{assign var=key2 value="`$prefix`fax02"}-->
                <!--{assign var=key3 value="`$prefix`fax03"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    FAX番号
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-xs-3<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <input type="tel" id="<!--{$key1}-->" class="box60 form-control padding-xs" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" />
                        </div>
                        <label class="control-label col-xs-1 padding-none">-</label>
                        <div class="col-xs-4<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
                            <input type="tel" class="box60 form-control" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" />
                        </div>
                        <label class="control-label col-xs-1 padding-none">-</label>
                        <div class="col-xs-4<!--{if $arrErr[$key3]}--> has-error<!--{/if}-->">
                            <input type="tel" class="box60 form-control" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|h}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->; ime-mode: disabled;" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->; ime-mode: disabled;" />
                        </div>
                      </div>
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></span>
                </div>
            </div>
    <!--{if $flgFields > 1}-->
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`email"}-->
                <!--{assign var=key2 value="`$prefix`email02"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    メールアドレス<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <input type="email" id="<!--{$key1}-->" class="box380 top form-control" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="user@domain.com" />
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
                            <input type="email" class="box380 form-control" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" style="<!--{$arrErr[$key1]|cat:$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" placeholder="メールアドレス確認用" />
                            <span class="attention"><!--{$arrErr[$key2]}--></span>
                            <p class="mini help-block"><span class="attention">確認のため2度入力してください。</span></p>
                        </div>
                    </div>
                </div>
            </div>
                <!--{if $emailMobile}-->
                <div class="form-group">
                    <!--{assign var=key1 value="`$prefix`email_mobile"}-->
                    <!--{assign var=key2 value="`$prefix`email_mobile02"}-->
                    <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                        携帯メールアドレス
                    </label>
                    <div class="col-sm-9">
                        <div class="form-group">
                            <div class="col-md-7<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                                <input type="email" id="<!--{$key1}-->" class="box380 top form-control" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" placeholder="user@mobile.com" />
                                <span class="attention"><!--{$arrErr[$key1]}--></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-7<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
                                <input type="email" class="box380 form-control" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" style="<!--{$arrErr[$key1]|cat:$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" placeholder="メールアドレス確認用" />
                                <span class="attention"><!--{$arrErr[$key2]}--></span>
                                <p class="mini help-block"><span class="attention">確認のため2度入力してください。</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--{/if}-->
            
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`sex"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    性別<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <div style="<!--{$arrErr[$key1]|sfGetErrorColor}-->">
                                <!--{html_radios name=$key1 options=$arrSex selected=$arrForm[$key1].value assign=sex}-->
                                <!--{foreach from=$sex item=radio}-->
                                    <div class="radio">
                                        <label>
                                            <!--{$radio}-->
                                        </label>
                                    </div>
                                <!--{/foreach}-->
                            </div>
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`job"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    職業
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <select id="<!--{$key1}-->" class="form-control" name="<!--{$key1}-->">
                                <option value="" selected="selected">選択してください</option>
                                <!--{html_options options=$arrJob selected=$arrForm[$key1].value}-->
                            </select>
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`year"}-->
                <!--{assign var=key2 value="`$prefix`month"}-->
                <!--{assign var=key3 value="`$prefix`day"}-->
                <!--{assign var=errBirth value="`$arrErr.$key1``$arrErr.$key2``$arrErr.$key3`"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    生年月日
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <div class="form-group">
                                <div class="col-xs-4 col-sm-4 padding-right-xs<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                                    <select id="<!--{$key1}-->" class="form-control" name="<!--{$key1}-->" style="<!--{$errBirth|sfGetErrorColor}-->">
                                    <!--{html_options options=$arrYear selected=$arrForm[$key1].value|default:''}-->
                                    </select>
                                </div>
                                <label class="control-label col-xs-1 padding-none">年</label>
                                <div class="col-xs-3 col-sm-3 padding-right-xs<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                                    <select class="form-control" name="<!--{$key2}-->" style="<!--{$errBirth|sfGetErrorColor}-->">
                                    <!--{html_options options=$arrMonth selected=$arrForm[$key2].value|default:''}-->
                                    </select>
                                </div>
                                <label class="control-label col-xs-1 padding-none margin-none">月</label>
                                <div class="col-xs-3 col-sm-3 padding-right-xs<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                                    <select class="form-control" name="<!--{$key3}-->" style="<!--{$errBirth|sfGetErrorColor}-->">
                                    <!--{html_options options=$arrDay selected=$arrForm[$key3].value|default:''}-->
                                    </select>
                                </div>
                                <label class="control-label col-xs-1 padding-none">日</label>
                            </div>
                            <span class="attention"><!--{$errBirth}--></span>
                        </div>
                    </div>
                </div>
            </div>
        <!--{if $flgFields > 2}-->
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`password"}-->
                <!--{assign var=key2 value="`$prefix`password02"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    希望するパスワード（記号可）<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <input type="password" id="<!--{$key1}-->" class="box380 top form-control" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" placeholder="半角英数字<!--{$smarty.const.PASSWORD_MIN_LEN}-->～<!--{$smarty.const.PASSWORD_MAX_LEN}-->文字" />
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
                            <input type="password" class="box380 form-control" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key1]|cat:$arrErr[$key2]|sfGetErrorColor}-->" placeholder="パスワード確認用" />
                            <span class="attention"><!--{$arrErr[$key2]}--></span>
                            <p class="mini help-block"><span class="attention">確認のため2度入力してください。</span></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`reminder"}-->
                <!--{assign var=key2 value="`$prefix`reminder_answer"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    パスワードを忘れた時のヒント<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <select id="<!--{$key1}-->" class="form-control" name="<!--{$key1}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->">
                                <option value="" selected="selected">質問を選択してください</option>
                                <!--{html_options options=$arrReminder selected=$arrForm[$key1].value}-->
                            </select>
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key2]}--> has-error<!--{/if}-->">
                            <input type="text" class="box380 form-control" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: active;" placeholder="質問の答え" />
                            <span class="attention"><!--{$arrErr[$key2]}--></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <!--{assign var=key1 value="`$prefix`mailmaga_flg"}-->
                <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                    メールマガジン送付について<span class="attention">※</span>
                </label>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="col-md-7<!--{if $arrErr[$key1]}--> has-error<!--{/if}-->">
                            <div style="<!--{$arrErr[$key1]|sfGetErrorColor}-->">
                                <!--{html_radios name=$key1 options=$arrMAILMAGATYPE selected=$arrForm[$key1].value assign=mailmagatype}-->
                                <!--{foreach from=$mailmagatype item=radio}-->
                                    <div class="radio">
                                        <label>
                                            <!--{$radio}-->
                                        </label>
                                    </div>
                                <!--{/foreach}-->
                            </div>
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                        </div>
                    </div>
                </div>
            </div>
        <!--{/if}-->
    <!--{/if}-->
<!--{/strip}-->
