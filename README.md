eccube-on-bootstrap3
====================
TwitterBootstrapを使った[EC-CUBE](http://www.ec-cube.net)用のデザインテンプレートです。


### 開発環境
- EC-CUBE 2.13.3
- Twitter Bootstrap3.3.4


### デモサイト
- [http://eccube-on-bootstrap3.no-tubo.net/](http://eccube-on-bootstrap3.no-tubo.net/)

## インストール方法
ダウンロードしたtarballをEC-CUBEの 管理画面 > デザイン管理 > テンプレート追加 から行います。

公式サイトの解説動画が参考になります。

- [MOVIEでわかる！5分で導入！「デザインテンプレート適用法」](http://vimeo.com/37297904?width=700&height=400)


### ダウンロード
- [eccube-on-bootstrap3.tar.gz](https://github.com/clicktx/eccube-on-bootstrap3/archive/master.tar.gz)


### 注意点
スマートフォン用テンプレートを無効化する必要があります。

- [EC-CUBEでスマホ用と携帯用テンプレートを無効にする方法 | SPOT[スポット]](http://spot-web.jp/ec-cubeでスマホ用と携帯用テンプレートを無効にする/)

##### プラグインでも対応できます【おすすめ！】

- [スマートフォン・携帯アクセス制御プラグイン](http://www.ec-cube.net/products/detail.php?product_id=394)

こちらのプラグインを利用するとスマートフォンからのアクセスの挙動をカスタマイズ出来ます。またガラケーの制御も同時に行えます。


## プラグインについて
公式サイトで配布されているプラグインはそのまま使えない場合が多いと思います（フロント機能のプラグインの場合はほぼ不可）eccube-on-bootstrap3テンプレートに最適化したプラグインを公開しています。

1. [全ページ対応パンくずリスト表示プラグイン](https://github.com/clicktx/eccube-on-bootstrap3-plugin-BreadcrumbList)
1. [AjaxZip3-for-2.13](https://github.com/clicktx/eccube-on-bootstrap3-plugin-AjaxZip3-for-2.13)
1. [注文完了画面でも会員登録](https://github.com/clicktx/eccube-on-bootstrap3-plugin-RegisterWhileShopping)
1. [ヘルプ機能](https://github.com/clicktx/eccube-on-bootstrap3-plugin-Help)


## その他
### vi/vimキーバインド
今流行りの（？）vi/vimキーバインドを搭載しています。~~遊び機能なのでコードはやっつけです。~~

【2014/10/8】jQuery.Vimizeに置き換えました。

- j,k　各項目移動（上下）
- h 左カラムへ
- l 右カラムへ
- 0 行頭
- $ 行末
- d,u スクロールダウン・アップ
- gg ページ最上段へスクロール
- G ページ最下段へスクロール
- /,? 検索
    - ctrl+w 入力文字の削除
- \- ホームページへ移動
- その他詳細は [jQuery.Vimize](https://github.com/clicktx/jquery-vimize) に書いてあります。


### Bootstrap2を使ったテーマ
- [eccube-bootstrapというEC CUBE用のテーマを作りました。 - ALLAURMONO](http://blog.nagaki.me/practice/released-eccube-bootstrap.html)  
- [https://github.com/nagaki/eccube-bootstrap](https://github.com/nagaki/eccube-bootstrap)
