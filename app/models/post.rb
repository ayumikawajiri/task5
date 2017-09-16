class Post < ApplicationRecord
	belongs_to :user
<<<<<<< HEAD
	has_many :post_images, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
	paginates_per 30

	validates :title, presence: true
	validates :price, presence: true
	validates :body, presence: true
=======
	mount_uploader :image, ImageUploader
>>>>>>> e5de3266dfaed05c7acf7cc7be1b9c78a201aaa4
end
