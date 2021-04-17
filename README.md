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