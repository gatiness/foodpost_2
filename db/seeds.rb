# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
​
Label.create! (
  [
    {name: 'おうちクッキング'},
    {name: 'テイクアウト'},
    {name: 'デリバリー'},
    {name: 'お酒'},
    {name: 'ソフトドリンク'},
    {name: '調味料'},
    {name: '酒のあて'},
  ]
)
​
# User
​
user1 = User.create!(
  name: "test1",
  email: "test1@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/user_icons/icon1.jpg"),
  admin: true
)
user2 = User.create!(
  name: "test2",
  email: "test2@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/user_icons/icon2.jpg"),
)
user3 = User.create!(
  name: "test3",
  email: "test3@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/user_icons/icon3.jpg"),
)
user4 = User.create!(
  name: "test4",
  email: "test4@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/user_icons/icon4.jpg"),
)
user5 = User.create!(
  name: "test5",
  email: "test5@example.com",
  password: "password",
  password_confirmation: "password",
  image: File.open("./app/assets/images/user_icons/icon5.jpg"),
)
​
​
# Post
​
post1_1 = Post.create!(
  title: "test-title1",
  content: "test_content1",
  user_id: user4.id,
)
​
post1_2 = Post.create!(
  title: "test-title2",
  content: "test_content2",
  user_id: user2.id,
)
​
post1_3 = Post.create!(
  title: "test-title3",
  content: "test_content3",
  user_id: user3.id,
)
​
post1_4 = Post.create!(
  title: "test-title4",
  content: "test_content4",
  user_id: user4.id,
)
​
post1_5 = Post.create!(
  title: "test-title5",
  content: "test_content5",
  user_id: user5.id
)
​
 # お気に入り
Favorite.create!(
  [
    # user1
    [user_id: user1.id, post_id: post1_1.id],
​
    # user2
    [user_id: user2.id, post_id: post1_3.id],
​
    # user3
    [user_id: user3.id, post_id: post1_2.id],
​
    # user4
    [user_id: user4.id, post_id: post1_5.id],
​
    # user5
    [user_id: user5.id, post_id: post1_4.id],
  ]
)