<!--{printXMLDeclaration}--><!DOCTYPE html>
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

<html lang="ja">
<head>
    <meta charset="<!--{$smarty.const.CHAR_CODE}-->" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<title><!--{$arrSiteInfo.shop_name|h}--><!--{if $tpl_subtitle|strlen >= 1}--> / <!--{$tpl_subtitle|h}--><!--{elseif $tpl_title|strlen >= 1}--> / <!--{$tpl_title|h}--><!--{/if}--></title>
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<!--{if $arrPageLayout.author|strlen >= 1}-->
    <meta name="author" content="<!--{$arrPageLayout.author|h}-->" />
<!--{/if}-->
<!--{if $arrPageLayout.description|strlen >= 1}-->
    <meta name="description" content="<!--{$arrPageLayout.description|h}-->" />
<!--{/if}-->
<!--{if $arrPageLayout.keyword|strlen >= 1}-->
    <meta name="keywords" content="<!--{$arrPageLayout.keyword|h}-->" />
<!--{/if}-->
<!--{if $arrPageLayout.meta_robots|strlen >= 1}-->
    <meta name="robots" content="<!--{$arrPageLayout.meta_robots|h}-->" />
<!--{/if}-->
<link rel="shortcut icon" href="<!--{$TPL_URLPATH}-->img/common/favicon.ico" />
<link rel="icon" type="image/vnd.microsoft.icon" href="<!--{$TPL_URLPATH}-->img/common/favicon.ico" />
<link rel="alternate" type="application/rss+xml" title="RSS" href="<!--{$smarty.const.HTTP_URL}-->rss/<!--{$smarty.const.DIR_INDEX_PATH}-->" />
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/eccube.js"></script>
<!-- #2342 次期メジャーバージョン(2.14)にてeccube.legacy.jsは削除予定.モジュール、プラグインの互換性を考慮して2.13では残します. -->
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/eccube.legacy.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.colorbox/jquery.colorbox-min.js"></script>
<!--{if $tpl_page_class_name === "LC_Page_Abouts"}-->
    <!--{if ($smarty.server.HTTPS != "") && ($smarty.server.HTTPS != "off")}-->
        <script type="text/javascript" src="https://maps-api-ssl.google.com/maps/api/js?sensor=false"></script>
    <!--{else}-->
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <!--{/if}-->
<!--{/if}-->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->bootstrap/3.3.4/css/bootstrap.min.css" />
<link rel="stylesheet" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.colorbox/colorbox.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/import.css" type="text/css" media="all" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="<!--{$TPL_URLPATH}-->bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="<!--{$TPL_URLPATH}-->js/jquery.plugin.js"></script>

<script type="text/javascript">//<![CDATA[
    <!--{$tpl_javascript}-->
    $(function(){
        <!--{$tpl_onload}-->
        // off canvas button
        $(document).on('click', '.toggle-offcanvas', function(){
            $('.row-offcanvas').toggleClass('active');
            return false;
        });

        // swipe event
        $("#main_column, #rightcolumn").on("touchstart", TouchStart);
        $("#main_column, #rightcolumn").on("touchmove" , TouchMove);

        function Position(e){
            var x = e.originalEvent.touches[0].pageX;
            var y = e.originalEvent.touches[0].pageY;
            x = Math.floor(x);
            y = Math.floor(y);
            var pos = {'x':x , 'y':y};
            return pos;
        }
        function TouchStart( event ) {
            var pos = Position(event);
            $("#main_column").data("memory",pos.x);
        }
        function TouchMove( event ) {
            var pos = Position(event); //X,Yを得る
            var start = $("#main_column").data("memory");
            var range = start - pos.x;
            if( range > 50){
                // 左に移動
                $('.row-offcanvas').removeClass('active');
            } else if (start < 30 && range < -10){
                // 右に移動
                $('.row-offcanvas').addClass('active');
            }
        }

        // input clear
        $(".input-clear").inputClear();
        // tooltip
        $('[data-toggle=tooltip]').tooltip();
        // pagetop
        var pageTop = function(){
            $((navigator.userAgent.indexOf("Opera") != -1) ? document.compatMode == 'BackCompat' ? 'body' : 'html' :'html,body').animate({scrollTop:0}, 'slow');
            return false;
        };
        var pageBottom = function(){
            $((navigator.userAgent.indexOf("Opera") != -1) ? document.compatMode == 'BackCompat' ? 'body' : 'html' :'html,body').animate({scrollTop: $(document).height()-$(window).height()}, 'slow');
            return false;
        };
        $("a[href^=#top]").click(pageTop);

        // vimize
        $().vimize({
            homePagePath: '/',
            searchBoxSelector: 'input#header-search',
            selectors: {
                0: '#category_area a',
                1: '#product-list-wrap a, .navi a, #main_column a',
            },
            defaultSelectors: 1,
            command: {
                CAT: function(){
                    window.location.href = 'https://www.google.co.jp/search?tbm=isch&q=cat';
                }
            },
            commandError: function(e){
                alert(e);
            }
        });
    });
//]]></script>

<!--{strip}-->
    <!--{* ▼Head COLUMN*}-->
    <!--{if $arrPageLayout.HeadNavi|@count > 0}-->
        <!--{* ▼上ナビ *}-->
        <!--{foreach key=HeadNaviKey item=HeadNaviItem from=$arrPageLayout.HeadNavi}-->
            <!--{* ▼<!--{$HeadNaviItem.bloc_name}--> *}-->
            <!--{if $HeadNaviItem.php_path != ""}-->
                <!--{include_php file=$HeadNaviItem.php_path}-->
            <!--{else}-->
                <!--{include file=$HeadNaviItem.tpl_path}-->
            <!--{/if}-->
            <!--{* ▲<!--{$HeadNaviItem.bloc_name}--> *}-->
        <!--{/foreach}-->
        <!--{* ▲上ナビ *}-->
    <!--{/if}-->
    <!--{* ▲Head COLUMN*}-->
<!--{/strip}-->
</head>

<!-- ▼BODY部 スタート -->
<!--{include file='./site_main.tpl'}-->
<!-- ▲BODY部 エンド -->

</html>
