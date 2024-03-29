# 食べるコミュニケーション
## サイト概要
### サイトテーマ
<!--何を『目的』とし、どのような『分類』なのかを簡潔に書く-->
​調味料に対して独自の食べ方や使い方を情報交換し、食を豊かにする事を目的としたコミュニティーサイト
### テーマを選んだ理由
<!--なぜこのようなテーマにしたかを説明する-->
香辛料や調味料に関して自身はあまり知識がなく、味付け等も決まった物しか使いませんでした。
そこで、他の人が実際に使っている調味料や香辛料の情報交換が出来る場があれば、
今までとは違った味の発見が出来ると思いこのテーマにしました。
また、物価高騰に伴い自炊をする人が増えていることをニュースで見たこともあり、そういった
方にも参考になればと思っています。
### ターゲットユーザ
<!--誰に使ってもらうかを具体的に記載する-->
- 自炊する人が料理を作る時に参考にしたい人
- 自分なりの味のアレンジを他の人にシェアしたい人
- 珍しい調味料や香辛料を自身の発見等を他の人にシェアしたい時
### 主な利用シーン
<!--どのような時に使うのかの状況を記載すること-->
- 事前に決まった場所の外食に行く前
- 自身がよく食べている料理の味の開拓をしたい時
- 自身が好きな調味料を使った料理や味付けを知りたい時
## 設計書
- [PF-AWS構成図](https://drive.google.com/file/d/1ll8rJER9HO9i_d05JOVrWy2fukw9geoV/view?usp=drive_link)
- [PF-AWSインフラ設計](https://docs.google.com/spreadsheets/d/1pF3m4XOwltrZLY6eExBw9y47Y8fy-tHX6XXj0uhoLAA/edit?usp=drive_link)
## 開発環境
- OS：Linux(AmazonLinux2)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
- ## Gemfile
- gem 'devise'
- gem 'image_processing', '~>1.2' 追加 (画像サイズの変更の為)
- gem 'bootstrap4-kaminari-views'
- gem 'rails-i18n'
- gem 'dotenv-rails'
- group :production do
-   gem 'mysql2'
- end
- gem "net-smtp"
- gem "net-pop"
- gem "net-imap"