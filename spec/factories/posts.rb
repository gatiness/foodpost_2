FactoryBot.define do
  factory :post do
    title { 'post 1' }
    content { 'content 1' }
  end
  factory :post2, class: Post do
    title { 'post 2' }
    content { 'content 2' }
  end
  factory :post3, class: Post do
    title { 'post 3' }
    content { 'content 3' }
  end
end