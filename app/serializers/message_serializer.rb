class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :chatroom
  belongs_to :user, through: :chatroom_users
  belongs_to :visitor, through: :chatroom_users
end
