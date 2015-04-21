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

<script type="text/javascript">//<![CDATA[
    $(function() {
        if ($('input[name=deliv_id]:checked').val()
            || $('#deliv_id').val()) {
            showForm(true);
        } else {
            showForm(false);
        }
        $('input[id^=deliv_]').click(function() {
            showForm(true);
            var data = {};
            data.mode = 'select_deliv';
            data.deliv_id = $(this).val();
            data['<!--{$smarty.const.TRANSACTION_ID_NAME}-->'] = '<!--{$transactionid}-->';
            $.ajax({
                type : 'POST',
                url : location.pathname,
                data: data,
                cache : false,
                dataType : 'json',
                error : remoteException,
                success : function(data, dataType) {
                    if (data.error) {
                        remoteException();
                    } else {
                        // 支払い方法の行を生成
                        var payment_body = $('#payment');
                        payment_body.empty();
                        for (var i in data.arrPayment) {
                            // 行
                            var row = $('<tr />').addClass('radio');
                            // ラジオボタン
                            <!--{* IE7未満対応のため name と id をベタ書きする *}-->
                            var radio = $('<input type="radio" name="payment_id" id="pay_' + i + '" />')
                                .val(data.arrPayment[i].payment_id);
                            // ラベル
                            var label = $('<label />')
                                .attr('for', 'pay_' + i)
                                .text(data.arrPayment[i].payment_method);
                                // 左カラム
                            row.append(
                                $('<td />')
                                .addClass('col-xs-5 col-md-3')
                                .append(radio)
                                .append(label)
                            );

                            // 支払方法の画像が登録されている場合は表示
                            if (data.img_show) {
                                var payment_image = data.arrPayment[i].payment_image;
                                if (payment_image) {
                                    var img = $('<img />').addClass('img-responsive padding-bottom-xs').attr('src', '<!--{$smarty.const.IMAGE_SAVE_URLPATH}-->' + payment_image);
                                    // ラベル
                                    var label = $('<label />').attr('for', 'pay_' + i);
                                    row.append(
                                        $('<td />')
                                        .addClass('col-xs-7 col-md-9')
                                        .append(label.append(img))
                                    );
                                } else {
                                    row.append(
                                        $('<td />').addClass('col-xs-7 col-md-9')
                                    );
                                }
                            }
                            row.appendTo(payment_body);
                        }
                        // お届け時間を生成
                        var deliv_time_id_select = $('select[id^=deliv_time_id]');
                        deliv_time_id_select.empty();
                        deliv_time_id_select.append($('<option />').text('指定なし').val(''));
                        for (var i in data.arrDelivTime) {
                            var option = $('<option />')
                                .val(i)
                                .text(data.arrDelivTime[i])
                                .appendTo(deliv_time_id_select);
                        }
                    }
                }
            });
        });

        /**
         * 通信エラー表示.
         */
        function remoteException(XMLHttpRequest, textStatus, errorThrown) {
            alert('通信中にエラーが発生しました。カート画面に移動します。');
            location.href = '<!--{$smarty.const.CART_URL}-->';
        }

        /**
         * 配送方法の選択状態により表示を切り替える
         */
        function showForm(show) {
            if (show) {
                $('#payment, div.delivdate, .select-msg').show();
                $('.non-select-msg').hide();
            } else {
                $('#payment, div.delivdate, .select-msg').hide();
                $('.non-select-msg').show();
            }
        }
    });
//]]></script>
<div id="undercolumn">
    <div id="undercolumn_shopping">
        <p class="flow_area">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`shopping/process/step2.tpl"}-->
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />

            <!--{assign var=key value="deliv_id"}-->
            <!--{if $is_single_deliv}-->
                <input type="hidden" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" id="deliv_id" />
            <!--{else}-->
            <div class="pay_area clearfix<!--{if $arrErr[$key] != ""}--> has-error<!--{/if}-->">
                <h3 class="page-header"><span class="fa fa-arrow-circle-right"></span> 配送方法</h3>
                <p>配送方法をご選択ください。</p>

                <div class="col-sm-12">
                    <!--{if $arrErr[$key] != ""}-->
                    <p class="attention"><!--{$arrErr[$key]}--></p>
                    <!--{/if}-->
                    <!--{section name=cnt loop=$arrDeliv}-->
                    <div class="radio">
                        <label>
                            <input type="radio" id="deliv_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->" value="<!--{$arrDeliv[cnt].deliv_id}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" <!--{$arrDeliv[cnt].deliv_id|sfGetChecked:$arrForm[$key].value}--> />
                            <!--{$arrDeliv[cnt].name|h}--><!--{if $arrDeliv[cnt].remark != ""}--><p><!--{$arrDeliv[cnt].remark|h|nl2br}--></p><!--{/if}-->
                        </label>
                    </div>
                    <!--{/section}-->
                </div>
            </div>
            <!--{/if}-->

            <!--{assign var=key value="payment_id"}-->
            <div class="pay_area<!--{if $arrErr[$key] != ""}--> has-error<!--{/if}-->">
                <h3 class="page-header"><span class="fa fa-arrow-circle-right"></span> お支払方法</h3>
                <p class="select-msg">お支払方法をご選択ください。</p>
                <p class="non-select-msg">まずはじめに、配送方法を選択ください。</p>

                <!--{if $arrErr[$key] != ""}-->
                <p class="attention"><!--{$arrErr[$key]}--></p>
                <!--{/if}-->

                <table id="payment" class="clearfix table">
                    <!--{section name=cnt loop=$arrPayment}-->
                        <tr>
                            <td class="col-xs-5 col-md-3">
                                <input type="radio" id="pay_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->"  value="<!--{$arrPayment[cnt].payment_id}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" <!--{$arrPayment[cnt].payment_id|sfGetChecked:$arrForm[$key].value}--> />
                                <label for="pay_<!--{$smarty.section.cnt.iteration}-->">
                                    <!--{$arrPayment[cnt].payment_method|h}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}-->
                                </label>
                            </td>
                            <td class="col-xs-7 col-md-9">
                            <!--{if $img_show}-->
                                <!--{if $arrPayment[cnt].payment_image != ""}-->
                                <label for="pay_<!--{$smarty.section.cnt.iteration}-->">
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrPayment[cnt].payment_image}-->" class="img-responsive padding-bottom-xs" />
                                </label>
                                <!--{/if}-->
                            <!--{/if}-->
                            </td>
                        </tr>
                    <!--{/section}-->
                </table>
            </div>

            <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
            <div class="pay_area02">
                <h3 class="page-header"><span class="fa fa-arrow-circle-right"></span> お届け時間帯</h3>
                <p class="select-msg">ご希望の方は、お届け時間を選択してください。</p>
                <p class="non-select-msg">まずはじめに、配送方法を選択ください。</p>
                <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
                <!--{assign var=index value=$shippingItem.shipping_id}-->
                    <!--{if $is_multiple}-->
                        <div class="delivdate top panel panel-default">
                            <div class="panel-heading text-bold">
                                お届け先 <!--{$smarty.foreach.shippingItem.iteration}-->
                            </div>
                            <div class="panel-body">
                                <!--{if $shippingItem.shipping_company_name}-->
                                    <!--{$shippingItem.shipping_company_name|h}--><br />
                                <!--{/if}-->
                                <!--{$shippingItem.shipping_name01}--><!--{$shippingItem.shipping_name02}--><br/>
                                <small><!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01}--><!--{$shippingItem.shipping_addr02}--></small>
                            </div>
                            <div class="panel-footer">
                    <!--{/if}-->
                                <div class="delivdate row">
                                    <div class="col-md-6 form-group">
                                        <!--★お届け日★-->
                                        <!--{assign var=key value="deliv_date`$index`"}-->
                                        <label for="<!--{$key}-->" class="control-label">
                                            お届け日：
                                        </label>
                                        <!--{if !$arrDelivDate}-->
                                            ご指定頂けません。
                                        <!--{else}-->
                                            <select name="<!--{$key}-->" id="<!--{$key}-->" class="form-control" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                                                <option value="" selected="">指定なし</option>
                                                <!--{assign var=shipping_date_value value=$arrForm[$key].value|default:$shippingItem.shipping_date}-->
                                                <!--{html_options options=$arrDelivDate selected=$shipping_date_value}-->
                                            </select>
                                        <!--{/if}-->
                                        <span class="attention"><!--{$arrErr[$key]}--></span>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <!--★お届け時間★-->
                                        <!--{assign var=key value="deliv_time_id`$index`"}-->
                                        <label for="<!--{$key}-->" class="control-label">
                                            お届け時間：
                                        </label>
                                        <select name="<!--{$key}-->" id="<!--{$key}-->" class="form-control" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                                            <option value="" selected="">お届け時間：指定なし</option>
                                            <!--{assign var=shipping_time_value value=$arrForm[$key].value|default:$shippingItem.time_id}-->
                                            <!--{html_options options=$arrDelivTime selected=$shipping_time_value}-->
                                        </select>
                                        <span class="attention"><!--{$arrErr[$key]}--></span>
                                    </div>
                                </div>
                    <!--{if $is_multiple}-->
                            </div>
                        </div>
                    <!--{/if}-->
                <!--{/foreach}-->
            </div>
            <!--{/if}-->

            <!-- ▼ポイント使用 -->
            <!--{if $tpl_login == 1 && $smarty.const.USE_POINT !== false}-->
                <div class="point_area">
                    <h3 class="page-header"><span class="fa fa-arrow-circle-right"></span> ポイントのご利用</h3>
                        <p class="font-size-md">
                            <span class="attention">1ポイントを<!--{$smarty.const.POINT_VALUE|number_format}-->円</span>として使用する事ができます。
                        </p>
                        <div class="point_announce">
                            <p>現在の所持ポイントは「<span class="point"><!--{$tpl_user_point|default:0|number_format}-->Pt</span>」です。<br />
                                今回ご購入合計金額：<span class="price"><!--{$arrPrices.subtotal|number_format}-->円</span> <span class="attention">(送料、手数料を含みません。)</span>
                            </p>
                            <ul class="list-group">
                                <li class="list-group-item clearfix">
                                    <input type="radio" id="point_on" name="point_check" value="1" <!--{$arrForm.point_check.value|sfGetChecked:1}--> onclick="eccube.togglePointForm();"<!--{if !$tpl_user_point}--> disabled="disabled"<!--{/if}--> />
                                    <label for="point_on">&nbsp;ポイントを使用する</label>
                                    <!--{assign var=key value="use_point"}-->
                                    <br />
                                    <div class="col-xs-4 col-md-2">
                                        <input type="tel" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|default:$tpl_user_point}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="box60 form-control" />
                                    </div>
                                    <div class="col-xs-8">
                                        ポイントを使用する。
                                    </div>
                                    <span class="attention"><!--{$arrErr[$key]}--></span>
                                </li>
                                <li class="list-group-item">
                                    <input type="radio" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check.value|sfGetChecked:2}--> onclick="eccube.togglePointForm();" />
                                    <label for="point_off">
                                    &nbsp;ポイントを使用しない</label>
                                </li>
                            </ul>
                    </div>
                </div>
            <!--{/if}-->
            <!-- ▲ポイント使用 -->

            <div class="pay_area02">
                <h3 class="page-header"><span class="fa fa-arrow-circle-right"></span> その他お問い合わせ</h3>
                <p>その他お問い合わせ事項がございましたら、こちらにご入力ください。</p>
                <div>
                    <!--★その他お問い合わせ事項★-->
                    <!--{assign var=key value="message"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <textarea name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" cols="70" rows="8" class="txtarea form-control" wrap="hard"><!--{"\n"}--><!--{$arrForm[$key].value|h}--></textarea>
                    <p class="attention"> (<!--{$smarty.const.LTEXT_LEN}-->文字まで)</p>
                </div>
            </div>

            <div class="btn_area row">
                <div class="col-sm-3 padding-right-none hidden-xs">
                    <a href="?mode=return" class="btn btn-default btn-block">戻る</a>
                </div>
                <div class="col-sm-6">
                    <button name="next" id="next" class="btn btn-primary btn-block xs-btn-lg sm-btn-lg">次へ</button>
                </div>
                <div class="col-xs-12 visible-xs margin-top-sm">
                    <a href="?mode=return" class="btn btn-default btn-sm btn-block">戻る</a>
                </div>
            </div>
        </form>
    </div>
</div>
