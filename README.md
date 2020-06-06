# カフェどっと混む

![トップ画像](.resources/top.png)

## 概要

- せっかく入ったカフェが満席だった...
- 今すぐ入れるカフェがあったらなぁ...
- カフェ選び失敗したくないなぁ...

そんな方のために「カフェどっと混む」を製作しました。
カフェどっと混むは、カフェの混雑状況が確認できるサイトです。お店の情報や口コミを見ることができます。これでもうカフェ難民にはしません。

## URL

▶ カフェどっと混む
https://cafedotcom.jp/

## 使用技術

### バックエンド

- Ruby 2.6.5
- Rails 5.2.4

### フロントエンド

- HTML5 + CSS3 + JavaScript
- jQuery
- Sass
- Materialize

### OSS

- Font Awesome
- Swiper
- Infinite Scroll

### データベース

- PostgreSQL 11.5

### インフラ環境

- AWS（VPC、EC2、RDS、ELB、Route53、ACM、S3）
- Docker
- Docker Compose
- Nginx
- Unicorn

### CI/CD

- GitHub
- Capistrano
- CircleCI

### 外部 API

- Google Maps API
- ぐるなび API

## アプリケーション構成図

![トップ画像](.resources/application_diagram.png)

## 機能一覧

### 混雑状況表示機能

![混雑状況表示機能](.resources/shop_status.gif)

### リアルタイム表示機能

- 新着コメント表示機能
- ランキング機能

![新着コメント表示機能](.resources/new_comments.png)
![ランキング機能](.resources/search_menu.png)

### 店舗情報検索機能

- キーワード検索
- 今空いているお店
- 近くのお店
- 電源があるお店
- Wi-Fi があるお店

![店舗情報検索機能](.resources/search_menu.png)

### コメント機能

- コメント（お店の混雑状況／満足度）投稿
- いいね
- SNS シェア

![コメント機能](.resources/shop_comments.png)

### ログイン機能

- ログイン／ログアウト（OmniAuth）
- サインアップ

### ユーザー情報管理機能

- 一覧表示／詳細表示／編集／削除

### 店舗情報管理機能

- 一覧表示／詳細表示／編集／削除

### お気に入り登録機能
