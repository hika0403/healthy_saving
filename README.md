# 食べたつもり貯金
[![Image from Gyazo](https://i.gyazo.com/00ee3fecbd38d78d20f8c58d5fd51ce2.png)](https://gyazo.com/00ee3fecbd38d78d20f8c58d5fd51ce2)

## 概要
毎日、自分の体重と達成できた貯金金額を記録し、『ダイエット』と『貯金』を同時に成功させよう！というアプリケーションです。ログイン機能がついてるため、ユーザーは誰にも見られずに記録、管理することができます。また、SNSへの投稿も簡単に行えるため、好きな時に自分の記録をシェアできます。

## 本番環境
__URL__ https://healthy-saving.herokuapp.com/

__ログイン情報__
<p>メールアドレス : aaa@aaa</p>
<p>パスワード : aaAA1111</p>

## 制作背景
一見、繋がりがないように思える『ダイエット』と『貯金』ですが、私は制作する以前からこの2つには繋がりがあると感じていました。
お菓子や飲み物などを買うことをやめることで体重の減少にも影響があると思っていました。しかし、2つを同時に記録できるアプリがなかったため、体重管理は体重を記録することができるアプリを、貯金は貯金金額を記録するアプリをそれぞれ使わなければいけませんでした。そこでその問題を解決することのできる「食べたつもり貯金」を制作いたしました。


## 工夫したポイント
今回のペルソナは

健康に痩せたいと思い始めた10〜20代の実家暮らしの学生です。

以下の実装はこのペルソナに徹底的に合わせて行ました。

1, viewは学生向けにポップに仕上げ、シンプルな機能を実装

配色は緑と黄色をベースにしました。緑は健康を、黄色はお金をイメージしています。

[![Image from Gyazo](https://i.gyazo.com/ab9df672a8958ca5c0e1893f6e5911d3.gif)](https://gyazo.com/ab9df672a8958ca5c0e1893f6e5911d3)

2, SNS認証か新規登録か選べる

今の10,20代は「デジタルネイティブ」と呼ばれる世代です。幼少期からパソコンや携帯電話などのIT技術と身近に接していた人たちだからこそSNSのアカウントを持っている割合が高いため、SNS認証は必須だと考えました。

[![Image from Gyazo](https://i.gyazo.com/a0b4190adb60bce0c7def5ab9cfd02bb.png)](https://gyazo.com/a0b4190adb60bce0c7def5ab9cfd02bb)

3, 目的を見失わないよう、トップページの上部に目的を配置

目的を毎日目に触れることは目標達成に大きく近くと考えています。

[![Image from Gyazo](https://i.gyazo.com/25ae9d27153e59e91913f40b90bb655a.png)](https://gyazo.com/25ae9d27153e59e91913f40b90bb655a)

4, 自分の記録が視覚的に見えるようグラフ化

Chart.jsを使い、非同期でグラフを実装することができました。

[![Image from Gyazo](https://i.gyazo.com/8d2c7d26b6a705b34e45c61381f5be82.gif)](https://gyazo.com/8d2c7d26b6a705b34e45c61381f5be82)

5, SNSへすぐ投稿できるよう機能を実装

[![Image from Gyazo](https://i.gyazo.com/dbe383350ecb2e3afc6c7e1a47b7570a.gif)](https://gyazo.com/dbe383350ecb2e3afc6c7e1a47b7570a)

## 使用技術
<p>フロントエンド : HTML/CSS</p>
<p>バックエンド : Ruby 2.6.5/Ruby on Rails 6.1.3.1</p>
<p>データベース : MySQL 14.14 </p>
<p>テスト : RSpec 3.10.0</p>
<p>エディタ : VSCode</p>
  <a href="HTML公式サイトURL"><img src="https://www.w3.org/html/logo/downloads/HTML5_Logo_256.png" height="45px;" /></a>
  <a href="ruby公式サイトURL"><img src="https://www.ruby-lang.org/images/header-ruby-logo.png" height="40px;" /></a>
  <a href="MySQL公式サイトURL"><img src="https://www.mysql.com/common/logos/logo-mysql-170x115.png" height="45px;" /></a>

## 課題や今後実装したい機能

## DB設計

### usersテーブル

| Column             | Type    | Option      | 
| ------------------ | ------- | ----------- | 
| family_name        | string  | null: false | 
| given_name         | string  | null: false | 
| email              | string  | null: false | 
| encrypted_password | integer | null: false | 
| nickname           | string  | null: false | 
| birth_day          | date    | null: false | 

#### Association
- has_one :goal
- has_many :moneys
- has_many :bodies

### goalsテーブル

| Column      | Type       | Option            | 
| ----------- | ---------- | ----------------- | 
| weight_goal | integer    | null: false       | 
| saving_goal | integer    | null: false       | 
| purpose     | string     | null: false       | 
| period      | date       | null: false       | 
| user        | references | foreign_key: true | 

#### Association
- belongs_to :user

### moneysテーブル

| Column        | Type       | Option            | 
| ------------- | ---------- | ----------------- | 
| saving_amount | integer    | null: false       | 
| text          | string     |                   | 
| user          | references | foreign_key: true | 

#### Association
- belongs_to :user

### bodiesテーブル

| Column | Type       | Option            | 
| ------ | ---------- | ----------------- | 
| weight | integer    | null: false       | 
| user   | references | foreign_key: true | 

#### Association
- belongs_to :user