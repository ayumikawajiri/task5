class Category < ApplicationRecord
	has_many :posts
	paginates_per 20
end
