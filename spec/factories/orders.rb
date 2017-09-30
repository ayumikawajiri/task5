FactoryGirl.define do

  factory :order, class: Order do
    ordername "user0"
    orderphone "09011112222"
    orderaddress "user0-0-0"
    orderemail "user0@user.com"
    association :post, factory: :post
    association :user, factory: :user1
  end

end