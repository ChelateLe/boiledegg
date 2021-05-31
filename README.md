# README

## users テーブル

| Column             | Type   | Options                   |
| ----------------   | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| image              | string |                           |

### Association

- has_many :posts, dependent: :destroy
- has_many :collabos
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :rooms, through: :entries
- has_many :comments
- has_many :likes

## posts テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| title         | string     | null: false                    |
| string        | text       |                                |

### Association

- belongs_to :user
- has_one :purchase_record
- has_one_attached :image

## collabos テーブル

| Column     | Type         | Options                                      |
| ---------- | ------------ | -------------------------------------------- |
| painter    | references   | null: false, foreign_key: {to_table: :users} |
| originator | references   | null: false, foreign_key: {to_table: :users} |
| title      | string       | null: false                                  |
| text       | text         |                                              |

### Association

- belongs_to :user

## rooms テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |

### Association

-