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

<div id="undercolumn">
    <div id="undercolumn_entry">
        <h2 class="title"><!--{$tpl_title|h}--></h2>
        <p>
            <!--{if $arrSiteInfo.company_name != ''}--><!--{$arrSiteInfo.company_name|h}-->は、<!--{/if}-->
            個人情報保護の重要性に鑑み、「個人情報の保護に関する法律」及び本プライバシーポリシーを遵守し、お客さまのプライバシー保護に努めます。
        </p>

        <h2 class="page-header">個人情報保護方針</h2>

            <!--{if $arrSiteInfo.company_name != ''}--><!--{$arrSiteInfo.company_name|h}-->（以下「当社」）は、<!--{/if}-->
            以下のとおり個人情報保護方針を定め、個人情報保護の仕組みを構築し、全従業員に個人情報保護の重要性の認識と取組みを徹底させることにより、個人情報の保護を推進致します。

            <h3>個人情報の管理</h3>
            <p>当社は、お客さまの個人情報を正確かつ最新の状態に保ち、個人情報への不正アクセス・紛失・破損・改ざん・漏洩などを防止するため、セキュリティシステムの維持・管理体制の整備・社員教育の徹底等の必要な措置を講じ、安全対策を実施し個人情報の厳重な管理を行ないます。</p>

            <h3>個人情報の利用目的</h3>
            <p>お客さまからお預かりした個人情報は、当社からのご連絡や業務のご案内やご質問に対する回答として、電子メールや資料のご送付に利用いたします。</p>

            <h3>個人情報の第三者への開示・提供の禁止</h3>
            <p>当社は、お客さまよりお預かりした個人情報を適切に管理し、次のいずれかに該当する場合を除き、個人情報を第三者に開示いたしません。
            <ul>
                <li>お客さまの同意がある場合</li>
                <li>お客さまが希望されるサービスを行なうために当社が業務を委託する業者に対して開示する場合</li>
                <li>法令に基づき開示することが必要である場合</li>
            </ul>
            </p>

            <h3>個人情報の安全対策</h3>
            <p>当社は、個人情報の正確性及び安全性確保のために、セキュリティに万全の対策を講じています。</p>

            <h3>ご本人の照会</h3>
            <p>お客さまがご本人の個人情報の照会・修正・削除などをご希望される場合には、ご本人であることを確認の上、対応させていただきます。</p>

            <h3>法令、規範の遵守と見直し</h3>
            <p>当社は、保有する個人情報に関して適用される日本の法令、その他規範を遵守するとともに、本ポリシーの内容を適宜見直し、その改善に努めます。</p>

            <h3>お問い合せ</h3>
            <p>当社の個人情報の取扱に関するお問い合せは下記までご連絡ください。
                <address>
                    <!--{if $arrSiteInfo.company_name != ''}--><strong><!--{$arrSiteInfo.company_name|h}--></strong><br><!--{/if}-->

                    〒<!--{$arrSiteInfo.zip01|h}-->-<!--{$arrSiteInfo.zip02|h}-->
                    <!--{$arrSiteInfo.addr01|h}--><!--{$arrSiteInfo.addr02|h}--><br>
                    <!--{if $arrSiteInfo.tel01}-->TEL:<!--{$arrSiteInfo.tel01|h}-->-<!--{$arrSiteInfo.tel02|h}-->-<!--{$arrSiteInfo.tel03|h}--><!--{/if}-->
                    <!--{if $arrSiteInfo.fax01}-->FAX:<!--{$arrSiteInfo.fax01|h}-->-<!--{$arrSiteInfo.fax02|h}-->-<!--{$arrSiteInfo.fax03|h}--><!--{/if}--><br>
                    Mail:<a href="<!--{$smarty.const.HTTPS_URL}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->">お問い合わせ</a>
                </address>
            </p>

            <p>
                <a href="http://www.webernote.net/webcreate/privacy-policy-template.html">【テンプレート】プライバシーポリシー（個人情報保護方針）のサンプル雛形</a> を利用しています。
            </p>
    </div>
</div>
