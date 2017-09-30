class Order < ApplicationRecord
	belongs_to :post
	belongs_to :user

	paginates_per 20

	validates :ordername, presence: true

	VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
	validates :orderphone, presence: true,
						   format: { with: VALID_PHONE_REGEX }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :orderemail, presence: true,
						   format: { with: VALID_EMAIL_REGEX }
						   
	validates :orderaddress, presence: true
end
