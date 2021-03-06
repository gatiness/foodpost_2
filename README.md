## タイトル  
### Foodpost

## コンセプト  
#### 身近な人たちから日々の食生活に関するインスピレーションをもらえるsns

コロナで外出が制限される中、人が作った料理やデリバリーでオーダーしたもの、飲んだものにインスパイアされることは日常のエンターテイメントに進化している。きれいな写真より、身近な人からのちょっとした情報共有の影響を受けてその日の食事が決まったりすることも多いけれど、それらをゆるくシェアできるプラットフォームがない。既存snsのストーリーズ機能もあるけれど、なんだかんだ言ってそれなりにきれいな写真にしないといけないプレッシャーがあったりする。そういうのは一切なしで、つぶやきレベルの投稿でインスピレーションがもらえるつぶやき系フードsns。

## バージョン
* Ruby2.6.5
* Rails5.2.5
* PostgreSQL13.2

## 機能一覧
* フード投稿を行う機能
* フード投稿をお気に入りする機能
* フード投稿にコメントする機能
* フード投稿検索機能
* サインアップ・ログイン機能
* ゲストログイン機能
* 管理者権限機能

## 実行手順
```
$ git clone https://github.com/gatiness/foodpost_2
$ cd foodpost
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```

## 就職termで学んだ機能
* コメント機能
* お気に入り機能

## カリキュラム外の機能
* Ransackを使ったフード投稿検索機能

## カタログ設計  
https://docs.google.com/spreadsheets/d/1ls_bjoni0kMUJg_XDwFJweyuvmrag4LFFCno9juPN7Y/edit#gid=0

## テーブル定義
https://docs.google.com/spreadsheets/d/1RXRPbN7fWqzaMlOsOl5tf_abiNnAMxe0gye-uujzbuE/edit?usp=sharing

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1ls_bjoni0kMUJg_XDwFJweyuvmrag4LFFCno9juPN7Y/edit#gid=1594898479

## ER図
<img src="./public/images/er.png" alt="ER図" width='650px'>  

## 画面遷移図
<img src="./public/images/transition.png" alt="画面遷移図" width='650px'>  
