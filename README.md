[![Image from Gyazo](https://i.gyazo.com/00ee3fecbd38d78d20f8c58d5fd51ce2.png)](https://gyazo.com/00ee3fecbd38d78d20f8c58d5fd51ce2)

# 概要
日々の体重と貯金金額を記録し、『ダイエット』と『貯金』を同時に成功させよう！というアプリケーションです。ログイン機能がついてるため、ユーザーは誰にも見られずに記録、管理することができます。反対にSNSへの投稿も簡単に行えるため、好きな時に自分の記録をシェアすることができます。

# 本番環境
__URL__ https://healthy-saving.herokuapp.com/

__ログイン情報__
<p>メールアドレス : aaa@aaa</p>
<p>パスワード : aaAA1111</p>

# 制作背景
一見、繋がりのない『ダイエット』と『貯金』ですが、私は制作する以前からこの2つには通じる物があると感じていました。
お菓子や飲み物などの購入を我慢することで、貯金だけでなく体重の減少にも影響があると思っていました。しかし、2つを同時に記録できるアプリがなかったため、体重管理は体重を記録するアプリを、貯金は貯金金額を記録するアプリをそれぞれ使わなければいけませんでした。そこで2つを同時に解決することのできる「食べたつもり貯金」を制作いたしました。


# 工夫したポイント
今回のペルソナは

__「健康的に痩せたいと思い始めた実家暮らしの10〜20代学生」です。__

このペルソナに合わせた実装とするため、大きく5つのことを工夫しました。

1, ランディングページは学生向けにポップに仕上げ、シンプルな機能を実装

配色を緑、黄色ベースにしました。緑は健康を、黄色はお金をイメージしています。

[![Image from Gyazo](https://i.gyazo.com/e2aa6727078b2aeb2959f40530ba5a74.gif)](https://gyazo.com/e2aa6727078b2aeb2959f40530ba5a74)

2, SNS認証か新規登録か選べる

今の10,20代は「デジタルネイティブ」と呼ばれる世代です。幼少期からパソコンや携帯電話などのIT技術と身近に接していた世代のためSNSのアカウントを持っている割合が高いと考え、SNS認証は必須だと思いました。

[![Image from Gyazo](https://i.gyazo.com/a0b4190adb60bce0c7def5ab9cfd02bb.png)](https://gyazo.com/a0b4190adb60bce0c7def5ab9cfd02bb)

3, トップページ上部にゴール（目的）を配置

継続してアプリを使用してもらうため、また自分で決めたゴールを達成してもらうために、毎日目に触れることができる位置にゴールを配置しました。どこに何を配置するのか意味を持たせるように心がけて実装しました。

[![Image from Gyazo](https://i.gyazo.com/f272e5a196a24b6d175bb3a491fcce4c.png)](https://gyazo.com/f272e5a196a24b6d175bb3a491fcce4c)

4, 視覚的に見えるように記録をグラフ化

gemであるchartkickとgroupdateを使いました。chartkickは配列のデータをRubyのメソッドへ渡すだけなので、Ruby側のみで実装が完結することが
できました。

[![Image from Gyazo](https://i.gyazo.com/7d17b4c1a5316c2430698f398439e297.gif)](https://gyazo.com/7d17b4c1a5316c2430698f398439e297)

5, SNSへすぐ投稿できるよう機能を実装

10~20代によく使われているFacebook、Twitter、LINEへシェアできるボタンを付けました。また、Twitterには今日の日付、URL、ハッシュタグを自動で付けてツイートできるよう実装し、より多くの人に拡散、またはアプリを使っている人たちで繋がれるようにしました。

[![Image from Gyazo](https://i.gyazo.com/198f11dce54a2b00b43ddb7d32a26921.gif)](https://gyazo.com/198f11dce54a2b00b43ddb7d32a26921)

# 使用技術
<p>フロントエンド : HTML/CSS</p>
<p>バックエンド : Ruby 2.6.5/Ruby on Rails 6.1.3.1</p>
<p>データベース : MySQL 14.14 </p>
<p>テスト : RSpec 3.10.0</p>
<p>エディタ : VSCode</p>
  <a href="https://html.spec.whatwg.org/"><img src="https://www.w3.org/html/logo/downloads/HTML5_Logo_256.png" height="45px;" /></a>
  <a href="https://www.ruby-lang.org/ja/documentation/"><img src="https://www.ruby-lang.org/images/header-ruby-logo.png" height="40px;" /></a>
  <a href="https://dev.mysql.com/doc/"><img src="https://www.mysql.com/common/logos/logo-mysql-170x115.png" height="45px;" /></a>

# 課題や今後実装したい機能
・パソコン画面の大きさでしかみることができない

→携帯にも合わせたレスポンシブデザインにしていきたい（サイドバーをタブにするなど）

・いつゴールが達成したときのかわかりにくい

→Javascriptを使い、ポップアップまたは通知が来るように実装したい

# DB設計

## usersテーブル

| Column             | Type    | Option      | 
| ------------------ | ------- | ----------- | 
| family_name        | string  | null: false | 
| given_name         | string  | null: false | 
| email              | string  | null: false | 
| encrypted_password | integer | null: false | 
| nickname           | string  | null: false | 
| birth_day          | date    | null: false | 

### Association
- has_one :goal
- has_many :moneys
- has_many :bodies

## goalsテーブル

| Column      | Type       | Option            | 
| ----------- | ---------- | ----------------- | 
| weight_goal | integer    | null: false       | 
| saving_goal | integer    | null: false       | 
| purpose     | string     | null: false       | 
| period      | date       | null: false       | 
| user        | references | foreign_key: true | 

### Association
- belongs_to :user

## moneysテーブル

| Column        | Type       | Option            | 
| ------------- | ---------- | ----------------- | 
| saving_amount | integer    | null: false       | 
| text          | string     |                   | 
| user          | references | foreign_key: true | 

### Association
- belongs_to :user

## bodiesテーブル

| Column | Type       | Option            | 
| ------ | ---------- | ----------------- | 
| weight | integer    | null: false       | 
| user   | references | foreign_key: true | 

### Association
- belongs_to :user
