FactoryBot.define do
  factory :post do
    title { 'post 1' }
    content { 'content 1' }
  end
  factory :post2, class: Post do
    title { 'チンパンジー' }
    content { '内容2' }
  end
  factory :post3, class: Post do
    title { 'ねこ' }
    content { '内容3' }
  end
end