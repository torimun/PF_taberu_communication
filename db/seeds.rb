# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#以下管理者用アカウント
Admin.create!(
  email: 'admin@admin',
  password: 'admins'
)

#以下テスト用アカウント
Customer.create!(
  user_name: 'customers1',
  email: 'customer1@customer1',
  introduction: 'これはテストアカウント',
  password: 'customers1'
  )