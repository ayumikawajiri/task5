class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
    validates :username, presence: true, uniqueness: true
  has_many :posts


=======
  has_many :posts
>>>>>>> e5de3266dfaed05c7acf7cc7be1b9c78a201aaa4
end
