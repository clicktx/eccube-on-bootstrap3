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
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <div id="undercolumn_login">
        <form class="form-signin" role="form" name="login_mypage" id="login_mypage" method="post" action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php" onsubmit="return eccube.checkLoginFormInputted('login_mypage')">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="login" />
            <input type="hidden" name="url" value="<!--{$smarty.server.REQUEST_URI|h}-->" />
            <div class="row">
                <div class="login_area col-md-6">
                    <h3><span class="fa fa-arrow-circle-right"></span> アカウントをお持ちの方</h3>
                    <p class="inputtext margin-bottom-lg">
                        会員の方は、登録時に入力されたメールアドレスとパスワードでログインしてください。
                    </p>
                    <div class="jumbotron padding-md">
                        <!--{assign var=key1 value="login_email"}-->
                        <input type="email"  class="box300 form-control" name="<!--{$key1}-->" value="<!--{$tpl_login_email|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" required="" autofocus="" placeholder="メールアドレス" />

                        <!--{assign var=key2 value="login_pass"}-->
                        <input type="password" class="box300 form-control" name="<!--{$key2}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" required="" placeholder="パスワード" />
                        <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                        <small>
                            <a href="<!--{$smarty.const.HTTPS_URL}-->forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->" onclick="eccube.openWindow('<!--{$smarty.const.HTTPS_URL}-->forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->','forget','600','460',{scrollbars:'no',resizable:'no'}); return false;" target="_blank"><span class="fa fa-question-circle"></span>パスワードを忘れた方はこちら</a>
                        </small>

                        <!--{assign var=key value="login_memory"}-->
                        <label class="checkbox margin-left-lg">
                          <input type="checkbox" name="<!--{$key}-->" value="1"<!--{$tpl_login_memory|sfGetChecked:1}--> id="login_memory" /> メールアドレスをコンピューターに記憶させる
                        </label>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">ログイン</button>
                    </div>
                    <div class="alert alert-warning margin-bottom-xl">
                        <p>
                            ※メールアドレスを忘れた方は、お手数ですが、<a href="<!--{$smarty.const.ROOT_URLPATH}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->">お問い合わせページ</a>からお問い合わせください。
                        </p>
                    </div>
                </div>
                <div class="col-md-6">
                    <h3><span class="fa fa-arrow-circle-right"></span> アカウントの作成</h3>
                    <div class="inputtext margin-bottom-xl">
                        <p>会員登録をすると便利なMyページをご利用いただけます。</p>
                        <p>また、ログインするだけで、毎回お名前や住所などを入力することなくスムーズにお買い物をお楽しみいただけます。</p>
                    </div>
                    <div class="jumbotron padding-md">
                        <a href="<!--{$smarty.const.ROOT_URLPATH}-->entry/kiyaku.php" class="btn btn-lg btn-danger btn-block">
                            会員登録へ
                        </a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
