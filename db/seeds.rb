# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
[
 {email: 'test@test.com', name: '直樹', password: 'password'},
 {email: 'test1@test.com', name: '山田花子', password: 'password'},
 {email: 'test2@test.com', name: '大阪太郎', password: 'password'},
 {email: 'test3@test.com', name: 'ラーメンマン', password: 'password'},
 {email: 'test4@test.com', name: 'ラーメン大好き', password: 'password'},
 {email: 'test5@test.com', name: '週７ラーメン', password: 'password'},

]
)