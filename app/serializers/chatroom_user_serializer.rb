class ChatroomUserSerializer < ActiveModel::Serializer
  attributes :id,
  belongs_to :chatroom
  belongs_to :user
  belongs_to :visitor
end
