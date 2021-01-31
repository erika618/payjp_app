# README

# アプリ名
payjp_app

<br>

# 説明

PAY.JPを用いて、商品の購入することができます。また購入後の商品はSold Out!!とメッセージが表示されます。
(PAY.JPが提供するテストモードを用いて、クレジット決済機能を試験的に実装しています。)
<br>
https://user-images.githubusercontent.com/68714247/106376336-b8887080-63d7-11eb-9d3b-20fcab9688cf.mp4

<br>

# ER図

[erd.pdf](https://github.com/erika618/payjp_app/files/5899267/erd.pdf)

# テーブル設計

## users テーブル

| Column               | Type       | Options           |
| :------------------  | :--------- | :---------------- |
| name                 | string     | null: false       |
| email                | string     | null: false       |
| encrypted_password   | string     | null: false       |

### Association

- has_one :card, dependent: :destroy

<br>

## items テーブル

| Column   | Type       | 
| :------- | :--------- |
| name     | string     | 
| price    | integer    | 

### Association

- has_one :item_order

<br>

## cards テーブル

| Column         | Type       | Options           |
| :------------- | :--------- | :---------------- |
| card_token     | string     | null: false       |
| customer_token | string     | null: false       |
| user_id        | references | foreign_key: true |

### Association

- belongs_to :user
<br>

## item_orders テーブル

| Column         | Type       | Options           |
| :------------- | :--------- | :---------------- |
| item_id        | references | foreign_key: true |

### Association

- belongs_to :item
<br>


# 使用しているバージョン等

- ruby 2.6.5
- Rails 6.0.3.4
- MySQL

<br>

# clone
```
% git clone https://github.com/erika618/payjp_app.git
% cd payjp_app
% bundle install
% yarn install
% rails db:create
% rails db:migrate
```

https://pay.jp/
予めログインのうえ、公開鍵と秘密鍵を環境変数に設定しておく必要があります。

<br>

# その他使用しているgem・使うコマンド
```
<!-- rubocop（インデントを整えるため） -->
% bundle exec rubocop -a
```