FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :user do
    name { 'araba' }
    email { "aaa@amail.com" }
    password { "1111pppp" }
    password_confirmation { '1111pppp' }
    admin { "false" }
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :admin, class: User do
    name { 'machiko' }
    email { "aaa@jmail.com" }
    password { "1111qqqq" }
    password_confirmation { '1111qqqq' }
    admin { "true" }
  end
  factory :user3, class: User do
    name { 'tigre' }
    email { "tigre@tmail.com" }
    password { "password" }
    password_confirmation { 'password' }
    admin { "false" }
  end
end