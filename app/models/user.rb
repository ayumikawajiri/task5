class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :username, presence: true
    VALID_USEREMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: true, format: { with: VALID_USEREMAIL_REGEX }
    validates :encrypted_password, presence: true
  has_many :posts, dependent: :destroy
  has_many :orders, dependent: :destroy

end
