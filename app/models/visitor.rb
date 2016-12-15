class Visitor < ApplicationRecord
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
end
