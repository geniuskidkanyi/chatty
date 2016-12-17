class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages, through: :chatroom_users
end
