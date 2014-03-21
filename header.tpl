<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2013 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
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
                    <ul class="nav navbar-nav">
                        <li><a href="#">HOME</a></li>
                        <li><a href="#">about</a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="mypage dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                aaaa <br>
                                <span class="glyphicon glyphicon-user"></span> アカウントサービス<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">
                                    ログインまたは新規登録
                                </li>
                                <li>
                                    <button href="#" class="btn btn btn-danger">ログイン</button>
                                </li>
                                <li>
                                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/login.php"><span class="glyphicon glyphicon-user"></span> MYページ</a>
                                </li>
                            </ul>
                        </li>
                        <li class="entry">
                            <a href="<!--{$smarty.const.ROOT_URLPATH}-->entry/kiyaku.php">
                                bbb <br>
                                <span class="glyphicon glyphicon-ok"></span> 会員登録
                            </a>
                        </li>
                        <li>
                            <a href="<!--{$smarty.const.CART_URL}-->">
                                ccc <br>
                                <span class="glyphicon glyphicon-shopping-cart"></span> カート<span class="badge bg-red" data-role="cart-total-quantity"></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- for small mobile -->
    <section id="mobile-nav" class="visible-xs">
        <div class="container margin-bottom-lg">
            <form ame="search_form" method="get" action="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php">
                <div class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-search"></span>
                    </span>
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                    <input type="hidden" name="mode" value="search" />
                    <input type="text" name="name" class="form-control input-clear" value="<!--{$smarty.get.name|h}-->" placeholder="キーワードを入力" />
                </div>
            </form>
        </div>

        <nav class="navbar navbar-default" role="navigation">
          <div class="container text-center">
            <ul class="nav navbar-nav">
                <li class="col-xs-3">
                    <a href="#" class="btn btn-link" data-toggle="offcanvas">
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
