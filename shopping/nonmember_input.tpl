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
<script>
    $(function(){
        var msf = $('#multiple-shippng-form');
        if ( !$('#deliv_label').prop("checked") ){ msf.hide(); }

        $('#deliv_label').click(function(){
            if ( $(this).prop("checked") ) {
                msf.show("normal");
            } else {
                msf.hide("normal");
            }
        });
    });
</script>

<div id="undercolumn">
    <div id="undercolumn_customer">

        <p class="flow_area">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`shopping/process/step1.tpl"}-->
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <div class="information alert alert-warning">
            <p>下記項目にご入力ください。「<span class="attention">※</span>」印は入力必須項目です。<br />
                <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                    入力後、一番下の「上記のお届け先のみに送る」<br/>
                    または「複数のお届け先に送る」ボタンをクリックしてください。
                <!--{else}-->
                    入力後、一番下の「次へ」ボタンをクリックしてください。
                <!--{/if}-->
            </p>
        </div>

        <form name="form1" id="form1" class="form-horizontal" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="nonmember_confirm" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />

            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`frontparts/form_personal_input.tpl" flgFields=2 emailMobile=false prefix="order_"}-->
                <div class="form-group">
                    <!--{assign var=key value="deliv_check"}-->
                    <label for="<!--{$key1}-->" class="col-sm-3 col-md-2 control-label">
                        お届け先
                    </label>
                    <div class="col-sm-9">
                        <div style="<!--{$arrErr[$key1]|sfGetErrorColor}-->">
                            <div class="alert alert-info">
                                <label>
                                    <input type="checkbox" name="<!--{$key}-->" value="1" onclick="eccube.toggleDeliveryForm();" <!--{$arrForm[$key].value|sfGetChecked:1}--> id="deliv_label" />
                                    <span class="attention">お届け先を指定</span>　※上記に入力された住所と同一の場合は省略可能です。
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
        <div id="multiple-shippng-form">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`frontparts/form_personal_input.tpl" flgFields=1 emailMobile=false prefix="shipping_"}-->
        </div>

            <div class="btn_area margin-top-xl">
                <div class="jumbotron padding-md col-sm-12">
                    <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                        <p class="alignC">この商品を複数のお届け先に送りますか？</p>
                        <div class="col-sm-6">
                            <button class="btn btn-primary btn-block margin-bottom-md xs-btn-lg sm-btn-lg" name="singular" id="singular">上記のお届け先のみ</button>
                        </div>
                        <div class="col-sm-6">
                            <a class="btn btn-primary btn-block margin-bottom-md xs-btn-lg sm-btn-lg" href="javascript:;" onclick="eccube.setModeAndSubmit('multiple', '', ''); return false">
                                複数のお届け先に送る
                            </a>
                        </div>
                    <!--{else}-->
                        <div class="col-md-6 col-md-push-3">
                            <button class="btn btn-primary btn-block xs-btn-lg sm-btn-lg" name="singular" id="singular">次へ</button>
                        </div>
                    <!--{/if}-->
                </div>
            </div>
        </form>
    </div>
</div>
