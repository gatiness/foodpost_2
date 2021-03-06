# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Label.create!(
#   [
#     {name: 'おうちクッキング'},
#     {name: 'テイクアウト'},
#     {name: 'デリバリー'},
#     {name: 'ドリンク'},
#     {name: 'その他'},
#   ]
# )

# Label
label1 = Label.create!(
  name: 'おうちクッキング',
)
label2 = Label.create!(
  name: 'テイクアウト',
)
label3 = Label.create!(
  name: 'デリバリー',
)
label4 = Label.create!(
  name: 'ドリンク',
)
label5 = Label.create!(
  name: 'その他',
)

# User
user1 = User.create!(
  name: "test1",
  email: "test1@example.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)
user1.image.attach(io: File.open('./app/assets/images/user_icons/icon1.png'), filename: 'icon1.png')

user2 = User.create!(
  name: "test2",
  email: "test2@example.com",
  password: "password",
  password_confirmation: "password"
)
user2.image.attach(io: File.open('./app/assets/images/user_icons/icon2.png'), filename: 'icon2.png')

user3 = User.create!(
  name: "test3",
  email: "test3@example.com",
  password: "password",
  password_confirmation: "password"
)
user3.image.attach(io: File.open('./app/assets/images/user_icons/icon3.png'), filename: 'icon3.png')

user4 = User.create!(
  name: "test4",
  email: "test4@example.com",
  password: "password",
  password_confirmation: "password"
)
user4.image.attach(io: File.open('./app/assets/images/user_icons/icon4.png'), filename: 'icon4.png')

user5 = User.create!(
  name: "test5",
  email: "test5@example.com",
  password: "password",
  password_confirmation: "password"
)
user5.image.attach(io: File.open('./app/assets/images/user_icons/icon5.png'), filename: 'icon5.png')

user6 = User.create!(
  name: "machiko",
  email: "aaa@jmail.com",
  password: "1111qqqq",
  password_confirmation: "1111qqqq",
  # image: image.attach(io: File.open('./app/assets/images/user_icons/icon6.png'), filename: 'icon6.png'),
  # article.image.attach(io: File.open('./app/assets/images/user_icons/icon6.png'), filename: 'icon6.png')
  admin: true
)
user6.image.attach(io: File.open('./app/assets/images/user_icons/icon6.png'), filename: 'icon6.png')



# Post
post1_1 = Post.create!(
  title: "レモンのパンケーキ",
  content: "レモンのせすぎ",
  user_id: user4.id,
)
post1_1.image.attach(io: File.open('./app/assets/images/post_images/image2.png'), filename: 'image2.png')
Labeling.create!(
  label_id: label1.id,
  post_id: post1_1.id,
)
post1_2 = Post.create!(
  title: "スイカの角切り",
  content: "スイカを角切りにしてみました！",
  user_id: user2.id
)
post1_2.image.attach(io: File.open('./app/assets/images/post_images/image3.png'), filename: 'imag3.png')
Labeling.create!(
  label_id: label2.id,
  post_id: post1_2.id,
)
post1_3 = Post.create!(
  title: "ズッキーニのトマト煮",
  content: "チキンのトマト煮のもうちょっと味がうすいやつ",
  # label_id: label3.id,
  user_id: user3.id
)
post1_3.image.attach(io: File.open('./app/assets/images/post_images/image4.png'), filename: 'image4.png')
Labeling.create!(
  label_id: label3.id,
  post_id: post1_3.id,
)
post1_4 = Post.create!(
  title: "インドの青鬼",
  content: "クラフトビールおいしいですね",
  # label_id: label4.id,
  user_id: user4.id
)
post1_4.image.attach(io: File.open('./app/assets/images/post_images/image1.png'), filename: 'image1.png')
Labeling.create!(
  label_id: label4.id,
  post_id: post1_4.id,
)
post1_5 = Post.create!(
  title: "山椒",
  content: "山椒をたくさんいただいたので瓶にいれました",
  # label_id: label5.id,
  user_id: user5.id
)
post1_5.image.attach(io: File.open('./app/assets/images/post_images/image5.png'), filename: 'image5.png')
Labeling.create!(
  label_id: label5.id,
  post_id: post1_5.id,
)
 # お気に入り
Favorite.create!(
  [
    # user1
    {user_id: user1.id, post_id: post1_1.id},

    # user2
    {user_id: user2.id, post_id: post1_3.id},

    # user3
    {user_id: user3.id, post_id: post1_2.id},

    # user4
    {user_id: user4.id, post_id: post1_5.id},

    # user5
    {user_id: user5.id, post_id: post1_4.id},
  ]
)