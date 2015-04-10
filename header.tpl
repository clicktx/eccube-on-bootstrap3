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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.    See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA    02111-1307, USA.
 *}-->

<!--▼HEADER-->
<!--{strip}-->
    <div id="header_wrap" class="navbar navbar-default navbar-static-top" role="navigation">
        <div id="header" class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target="#header_navi">
                    <span class="sr-only">navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<!--{$smarty.const.TOP_URL}-->"><!--{$arrSiteInfo.shop_name|h}--></a>
            </div>

            <div id="header_utility">
                <div id="headerInternalColumn">
                <!--{* ▼HeaderInternal COLUMN *}-->
                <!--{if $arrPageLayout.HeaderInternalNavi|@count > 0}-->
                    <!--{* ▼上ナビ *}-->
                    <!--{foreach key=HeaderInternalNaviKey item=HeaderInternalNaviItem from=$arrPageLayout.HeaderInternalNavi}-->
                        <!-- ▼<!--{$HeaderInternalNaviItem.bloc_name}--> -->
                        <!--{if $HeaderInternalNaviItem.php_path != ""}-->
                            <!--{include_php file=$HeaderInternalNaviItem.php_path items=$HeaderInternalNaviItem}-->
                        <!--{else}-->
                            <!--{include file=$HeaderInternalNaviItem.tpl_path items=$HeaderInternalNaviItem}-->
                        <!--{/if}-->
                        <!-- ▲<!--{$HeaderInternalNaviItem.bloc_name}--> -->
                    <!--{/foreach}-->
                    <!--{* ▲上ナビ *}-->
                <!--{/if}-->
                <!--{* ▲HeaderInternal COLUMN *}-->
                </div>
                <div id="header_navi" class="collapse navbar-collapse">
                    <div class="navbar-form navbar-left hidden-xs hidden-sm">
                        <form role="search" name="search_form" id="header_search_form" method="get" action="<!--{$smarty.const.ROOT_URLPATH}-->
                            products/list.php">
                            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                            <input type="hidden" name="mode" value="search" />
                            <div class="input-group">
                              <input type="text" id="header-search" class="form-control" name="name" maxlength="50" value="<!--{$smarty.get.name|h}-->" placeholder="キーワードを入力">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-default hidden-xs hidden-sm">検索</button>
                                </span>
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="mypage dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                こんにちは
                                <!--{if $smarty.session.customer.customer_id}-->
                                、<!--{$smarty.session.customer.name01}--><!--{$smarty.session.customer.name02}-->さん
                                <!--{else}-->
                                。ログイン
                                <!--{/if}-->
                                <br />
                                <span class="font-size-md">
                                    <span class="glyphicon glyphicon-user"></span> アカウントサービス<span class="caret"></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu">
                                <!--{if !$smarty.session.customer.customer_id}-->
                                <li class="dropdown-header">
                                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/login.php" class="btn btn-default">ログイン</a>
                                    <span>はじめてのご利用ですか？<a href="<!--{$smarty.const.ROOT_URLPATH}-->entry/kiyaku.php">新規登録はこちら</a></span>
                                </li>
                                <li class="divider"></li>
                                <!--{/if}-->
                                <li class="dropdown-header">
                                    アカウントサービス
                                </li>
                                <li>
                                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/login.php"><span class="glyphicon glyphicon-user"></span> MYページ</a>
                                </li>
                                <li>
                                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/login.php"><span class="fa fa-clock-o"></span> 購入履歴</a>
                                </li>
                                <li>
                                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/favorite.php"><span class="fa fa-star"></span> お気に入り</a>
                                </li>
                                <!--{if $smarty.session.customer.customer_id}-->
                                <li class="dropdown-header">
                                    設定
                                </li>
                                <li>
                                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/change.php"><span class="fa fa-wrench"></span> 会員登録内容変更</a>
                                </li>
                                <li>
                                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/delivery.php"><span class="fa fa-truck"></span> お届け先追加・変更</a>
                                </li>
                                <!--{/if}-->
                                <li class="divider"></li>
                                <!--{if $smarty.session.customer.customer_id}-->
                                <li class="dropdown-header">
                                    <!--{$smarty.session.customer.name01}--><!--{$smarty.session.customer.name02}-->さんではありませんか？
                                </li>
                                <li>
                                    <a href="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php?mode=logout"><span class="glyphicon glyphicon-log-out"></span> ログアウト</a>
                                </li>
                                <!--{else}-->
                                <li>
                                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/login.php"><span class="glyphicon glyphicon-log-in"></span> ログイン</a>
                                </li>
                                <!--{/if}-->
                            </ul>
                        </li>
                        <li class="hidden-xs">
                            <a href="<!--{$smarty.const.CART_URL}-->">
                                <br />
                                <span class="font-size-md">
                                    <span class="glyphicon glyphicon-shopping-cart"></span> カート<span class="badge bg-red" data-role="cart-total-quantity"></span>
                                </span>
                            </a>
                        </li>
                        <li class="visible-xs"><a href="<!--{$smarty.const.ROOT_URLPATH}-->abouts/<!--{$smarty.const.DIR_INDEX_PATH}-->">当サイトについて</a></li>
                        <li class="visible-xs"><a href="<!--{$smarty.const.HTTPS_URL}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->">お問い合わせ</a></li>
                        <li class="visible-xs"><a href="<!--{$smarty.const.ROOT_URLPATH}-->order/<!--{$smarty.const.DIR_INDEX_PATH}-->">特定商取引法に基づく表示</a></li>
                        <li class="visible-xs"><a href="<!--{$smarty.const.ROOT_URLPATH}-->guide/privacy.php">プライバシーポリシー</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- for small mobile -->
    <section id="mobile-nav" class="hidden-md hidden-lg">
        <div class="container margin-bottom-lg">
            <form name="search_form" method="get" action="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php">
                <div class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-search"></span>
                    </span>
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                    <input type="hidden" name="mode" value="search" />
                    <input type="text" class="form-control input-clear" name="name" value="<!--{$smarty.get.name|h}-->" placeholder="キーワードを入力" />
                </div>
            </form>
        </div>
        <nav class="navbar navbar-default hidden-sm" role="navigation">
          <div class="container text-center">
            <ul class="nav navbar-nav">
                <li class="col-xs-3">
                    <a href="#" class="btn btn-link toggle-offcanvas">
                        <span class="glyphicon glyphicon-list-alt fa-2x"></span><br />
                        <small>カテゴリ</small>
                    </a>
                </li>
                <li class="col-xs-3">
                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/login.php" class="btn btn-link">
                        <span class="glyphicon glyphicon-user fa-2x"></span><br />
                        <small>MYページ</small>
                    </a>
                </li>
                <li class="col-xs-3">
                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/favorite.php" class="btn btn-link">
                        <span class="glyphicon glyphicon-star-empty fa-2x"></span><br />
                        <small>お気に入り</small>
                    </a>
                </li>
                <li class="col-xs-3">
                    <a href="<!--{$smarty.const.CART_URL}-->" class="btn btn-link">
                        <span class="glyphicon glyphicon-shopping-cart fa-flip-horizontal fa-2x"></span><br />
                        <small>カート</small>
                        <span class="cart-total-quantity badge bg-red" data-role="cart-total-quantity"></span>
                    </a>
                </li>
            </ul>
          </div>
        </nav>
    </section>
    <!-- for small mobile -->
<!--{/strip}-->
<!--▲HEADER-->
