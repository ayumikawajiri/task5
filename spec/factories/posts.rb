FactoryGirl.define do

  factory :post, class: Post do
  	title "めがね"
  	price 5000
  	body "5000円のめがねです"
    association :category, factory: :category
    association :user, factory: :user0
  end

end