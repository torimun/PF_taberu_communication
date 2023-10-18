# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#以下管理者用アカウント
admin= Admin.find_or_create_by!(email: "admin@admin") do |admin|
  admin.password = ENV['AWS_PF_ACCESS_ADMIN_KEY']
end

#以下テスト用アカウント
customers1 = Customer.find_or_create_by!(email: "customer1@customer1") do |customer|
  customer.user_name = "customers1",
  customer.password = "customers1",
  customer.introduction = "これはテストアカウント"
end