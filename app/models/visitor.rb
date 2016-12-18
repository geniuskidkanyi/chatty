class Visitor < ApplicationRecord
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
  # geocoded_by :full_street_address   # can also be an IP address
  # after_validation :geocode          # auto-fetch coordinates
end
