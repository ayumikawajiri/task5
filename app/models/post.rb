class Post < ApplicationRecord
	belongs_to :user

	has_many :post_images, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
	paginates_per 30

	validates :title, presence: true
	validates :price, presence: true
	validates :body, presence: true

end
