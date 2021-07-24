# 📙【BoiledEgg】 の README!
## 📖アプリケーション概要
### 🥚アプリケーション名：BoiledEgg
![トップページ](https://i.gyazo.com/3a7684e16b8cfb250ed8b674da23fd77.jpg)

### 🥚【BoiledEgg】とは？
BoiledEggは画像投稿・共有ができるアプリケーションです。<br>
自分のイラストを投稿するだけでなく、ダイレクトメッセージ機能を介し<br>
他のユーザーからイラストの依頼・アイデアを受け取ることで<br>
「コラボ作品」としてイラストを投稿することができます。<br>
また、投稿一覧より自分にとってお気に入りのユーザーを見つけ<br>
そのユーザーに依頼・アイデアを送信することもできます。<br>

### 🥚制作背景
・何かイラストを描きたいけれど、アイデアがない時、誰かのアイデアが欲しい<br>
・「これ描いてみて」と言われ、実際に描いたときに喜んでもらえると嬉しい<br>
・良い構図やアイデアがあっても、自分の画力では実現できないことがある<br>
・TwitterなどのSNSを介さず気軽にイラストの依頼ができる環境が欲しい<br>
☝️上記の課題、経験を踏まえて今回のアプリケーションを開発しました。

<br>

## 📱機能
<details>
<summary>このアプリケーションで可能なこと</summary>

![マイページ](https://i.gyazo.com/5503ea0864a2b63969ed66010bd276f0.jpg)

◎ユーザー登録機能<br>
◎画像投稿機能<br>
◎コメント機能<br>
◎ダイレクトメッセージ機能<br>
→ユーザーのマイページよりチャット画面に移動<br>
◎いいね機能（❤️）<br>
◎合作投稿機能<br>
→依頼（メッセージ）をくれたユーザーを発案者として選択しイラストを投稿できる<br>

</details>

<br>

## 📚今後の課題
<details>
<summary>改善できる部分・問題点</summary>
◎！！コラボ作品投稿機能のmaterialize対応<br>
・materializeとの相性の問題で、「発案者」のプルダウンメニューが表示されていない<br>
◎エラーメッセージをflashメッセージ化する<br>
・現在は登録内容、投稿内容に不備があるとページ遷移しないだけ<br>
・deviseの初期エラーメッセージだとわかりづらい上、見た目が好みでない<br>
◎テストコード<br>
・ユーザー登録、作品投稿の単体テストコード<br>
・無くても動くが、せっかくならしっかりとした動作確認を行いたい<br>
◎ユーザー画像変更の際に、非同期通信で表示できるようにする<br>
・現在は画像選択した時点ではどのように切り抜かれて表示されるかがわからない<br>
◎メッセージ、コメントを非同期通信で送信できるようにする<br>
・送信するたびにロードが入るのは好ましくない<br>
◎レスポンシブwebデザインの対応<br>
・手軽な画像投稿サービスを目指すならば、手軽にスマートフォンなどからも利用できるようにするべき<br>
◎ローディング画面の編集<br>
・本番環境だと投稿の際などに時間がかかる<br>
・cssだけで実装可能らしい<br>
◎ご意見箱ページの実装<br>
・どんなアプリケーションにも必要だと考える<br>

</details>

<br>

## 🌲本番環境
<details>
<summary>テストアカウント・ログイン情報</summary>

<br>

### 🚖アクセス方法: 【IPアドレス（13.114.6.83）にアクセス】
<br>

### 🔐ログイン用キーペア
#### ユーザー名: pear / パスワード:2741
<br>

### 📗テストアカウント①
#### 📮メールアドレス①： abc@gmail.com
#### 🔑パスワード①： abc123
<br>

### 📗テストアカウント② 
#### 📮メールアドレス②： 123@gmail.com
#### 🔑パスワード②： 123abc
<br>
</details>
<br>

## 🛠使用技術
<details>
<summary>使用技術・開発環境</summary>

<br>

### 📚使用技術:【Ruby,HTML,Sass,Javascript(jQuery)】
### 🎁フレームワーク:【Ruby on rails(6.0.3.6)】
### 🌳開発場所:Visual Studio Code

</details>
<br>

## 📝DB設計
<details>
<summary>テーブル・アソシエーション一覧</summary>

## users テーブル

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
<br>
