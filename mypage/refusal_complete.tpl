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
    <!--{include file = $tpl_navi}-->
    <div id="mycontents_area">
        <h3><!--{$tpl_subtitle|h}--></h3>
        <div id="complete_area">
            <div class="message alert alert-info">
                退会手続きが完了いたしました。
            </div>

            <div class="shop_information col-xs-12 padding-bottom-xl">
                <p>
                    MYページをご利用いただき誠にありがとうございました。<br />
                    またのご利用を心よりお待ち申し上げます。
                </p>
                <address class="shop_information">
                    <strong class="font-size-lg"><!--{$arrSiteInfo.company_name|h}--></strong><br />
                    TEL：<!--{$arrSiteInfo.tel01}-->-<!--{$arrSiteInfo.tel02}-->-<!--{$arrSiteInfo.tel03}-->
                    <!--{if $arrSiteInfo.business_hour != ""}-->
                    (受付時間/<!--{$arrSiteInfo.business_hour}-->)
                    <!--{/if}--><br />
                    E-mail：<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a>
                </address>
            </div>
            <div class="btn_area row">
                <div class="col-sm-12 col-md-6">
                    <a href="<!--{$smarty.const.TOP_URL}-->" class="btn btn-default btn-block">トップページへ</a>
                </div>
            </div>
        </div>
    </div>
</div>
