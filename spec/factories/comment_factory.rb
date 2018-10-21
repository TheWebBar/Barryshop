FactoryBot.define do
  sequence(:user_id) { |n| "#{n}" }
  sequence(:product_id) { |n| "#{n}" }

  factory :comment, class: Comment do
    rating 3.0
    body 'Great!'
    user_id
    product_id
  end
end
