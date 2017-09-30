FactoryGirl.define do

  factory :user0, class: User do
  	username "user0"
  	email "user0@user.com"
  	password 12345678
  end

  factory :user1, class: User do
  	username "user1"
  	email "user1@user.com"
  	password 23456789
  end

end