# 📙README is HERE!

# 📖アプリケーションの概要
## 💻アプリケーション名：【BoiledEgg】
## 🚖アクセス方法: 【IPアドレス（13.114.6.83）にアクセス】
## 📚使用言語・ライブラリ:【Ruby,HTML,Sass,Javascript(jQuery)】
## 🎁フレームワーク:【Ruby on rails(6.0.3.6)】  

# テーブル情報
<details>
<summary>テーブル一覧</summary>
### users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| image              | string |                           |

#### Association

- has_many :posts, dependent: :destroy
- has_many :collabos
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :rooms, through: :entries
- has_many :comments
- has_many :likes

## posts テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| title  | string     | null: false       |
| text   | string     |                   |

### Association

- belongs_to :user
- has_one_attached :image
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## collabos テーブル

| Column     | Type         | Options                         |
| ---------- | ------------ | ------------------------------- |
| painter    | references   | foreign_key: {to_table: :users} |
| originator | references   | foreign_key: {to_table: :users} |
| title      | string       | null: false                     |
| text       | text         |                                 |

### Association

- belongs_to :painter, class_name: "User", foreign_key: "painter_id"
- belongs_to :originator, class_name: "User", foreign_key: "originator_id"
- has_one_attached :image
- has_many :c_comments, dependent: :destroy
- has_many :c_likes, dependent: :destroy

## rooms テーブル

| Column | Type | Options |
| ------ | ---- | ------- |

### Association

- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :users, through: :entries

## Entries テーブル

| Column | Type         | Options     |
| ------ | ------------ | ----------- |
| user   | references   | null: false |
| room   | references   | null: false |

### Association

- belongs_to :user
- belongs_to :room

## messages テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| title  | string     | null: false       |
| text   | text       |                   |

### Association

- belongs_to :user
- belongs_to :room

## comments テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| post   | references | foreign_key: true |
| text   | text       | null: false       |

### Association

- belongs_to :user
- belongs_to :post

### likes テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| post   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## c_comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| collabo | references | foreign_key: true |
| text    | text       | null: false       |

### Association

- belongs_to :user
- belongs_to :collabo

### c_likes テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| collabo | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :collabo
</details>
