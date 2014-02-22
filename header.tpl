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
                <button class="navbar-toggle">
                    <span class="sr-only">navigation</span>
                    <span class="glyphicon glyphicon-shopping-cart"></span>
                </button>
                <button class="navbar-toggle" data-toggle="collapse" data-target="#header_navi">
                    <span class="sr-only">navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<!--{$smarty.const.TOP_URL}-->"><!--{$arrSiteInfo.shop_name|h}-->/<!--{$tpl_title|h}--></a>
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
                        <li><a href="#">contact</a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="mypage dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <!--{if $tpl_login}-->ようこそ ユーザーさん<br>
                                <!--{else}-->ゲストさん<br>
                                <!--{/if}-->
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
    <section class="block visible-xs">
    <div class="container">
        <form action="">
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                <input type="text" class="form-control" placeholder="キーワードを入力">
            </div>
        </form>
    </div>
    </section>

    <nav class="navbar navbar-default visible-xs" role="navigation">
      <div class="container text-center">
        <ul class="nav navbar-nav">
            <li class="col-xs-4">
                <a href="#" class="btn btn-link">
                    <span class="glyphicon glyphicon-lock large"></span><br />
                    <small>ログイン</small>
                </a>
            </li>
            <li class="col-xs-4">
                <a href="#" class="btn btn-link">
                    <span class="glyphicon glyphicon-user large"></span><br />
                    <small>MYページ</small>
                </a>
            </li>
            <li class="col-xs-4">
                <a href="#" class="btn btn-link">
                    <span class="glyphicon glyphicon-shopping-cart large"></span>
                    <span class="badge bg-red" data-role="cart-total-quantity"></span><br />
                    <small>カートを見る</small>
                </a>
            </li>
        </ul>
      </div>
    </nav>
    <!-- for small mobile -->


<!--{/strip}-->
<!--▲HEADER-->
