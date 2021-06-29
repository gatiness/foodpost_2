FactoryBot.define do
  factory :comment do
    comment {'comment1'}
    # association :user
  end
  factory :comment2 , class: Comment do
    comment {'comment1'}
    # association :user
  end
end