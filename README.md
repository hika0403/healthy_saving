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

| Column      | Type      | Option            | 
| ----------- | --------- | ----------------- | 
| weight_goal | string    | null: false       | 
| saving_goal | string    | null: false       | 
| purpose     | string    | null: false       | 
| period      | data      | null: false       | 
| user        | reference | foreign_key: true | 

### Association
- belongs_to :user

## moneysテーブル

| Column        | Type      | Option            | 
| ------------- | --------- | ----------------- | 
| saving_amount | string    | null: false       | 
| day           | date      | null: false       | 
| text          | string    |                   | 
| goal          | reference | foreign_key: true | 
| user          | reference | foreign_key: true | 

### Association
- belongs_to :goal
- belongs_to :user

## bodiesテーブル

| Column | Type      | Option            | 
| ------ | --------- | ----------------- | 
| weight | integer   | null: false       | 
| goal   | reference | foreign_key: true | 
| user   | reference | foreign_key: true | 

### Association
- belongs_to :goal
- belongs_to :user