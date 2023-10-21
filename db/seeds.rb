# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#以下管理者アカウント
Admin.find_or_create_by!(email: ENV['AWS_PF_ACCESS_ADMIN_EMAIL']) do |admin|
  admin.password = ENV['AWS_PF_ACCESS_ADMIN_KEY']
end

#以下会員初期登録アカウント
Customer.find_or_create_by!(email: "customer1@customer1.com") do |customer_detail|
  customer_detail.user_name = 'とろろ'
  customer_detail.password = 'customers1'
  customer_detail.introduction = '主に、和食関連の投稿をメインにしています。'
end

Customer.find_or_create_by!(email: "customer2@customer2.com") do |customer_detail|
  customer_detail.user_name = 'モカ'
  customer_detail.password = 'customers2'
  customer_detail.introduction = '洋食が好きなので、よく洋食の投稿を見に行っています。'
end

Customer.find_or_create_by!(email: "customer3@customer3.com") do |customer_detail|
  customer_detail.user_name = 'チー太郎'
  customer_detail.password = 'customers3'
  customer_detail.introduction = '一番好きなものはチーズなので、チーズ関連の投稿に目がないです!'
end

Customer.find_or_create_by!(email: "customer4@customer4.com") do |customer_detail|
  customer_detail.user_name = 'ただのカレー好き'
  customer_detail.password = 'customers4'
  customer_detail.introduction = '自身でカレーを作るので、知らない香辛料を探して試すのが好きです'
end

Customer.find_or_create_by!(email: "customer5@customer5.com") do |customer_detail|
  customer_detail.user_name = 'つまみ'
  customer_detail.password = 'customers5'
  customer_detail.introduction = 'お酒にあう料理があるといいな。'
end

Customer.find_or_create_by!(email: "customer6@customer6.com") do |customer_detail|
  customer_detail.user_name = 'ウォーク'
  customer_detail.password = 'customers6'
  customer_detail.introduction = '外食を良くするので、既存の料理の新しい食べ方が知りたいです'
end

Customer.find_or_create_by!(email: "customer7@customer7.com") do |customer_detail|
  customer_detail.user_name = 'kotori'
  customer_detail.password = 'customers7'
  customer_detail.introduction = '鶏肉を使った料理が好きなので、鶏肉関連の料理が気になっています。'
end

#会員投稿登録
Post.create!(
  post.customer_id = Customer.find_or_create_by!(email: "customer1@customer1.com").id,
  post.genre = '和食です',
  post.comment = '今回は唐辛子でピり肉じゃがを作ってみました！'
  )