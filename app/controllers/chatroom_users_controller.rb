class ChatroomUsersController < ApplicationController
  before_action :set_chatroom


  def create
    @chatroom_user = @chatroom.chatroom_users.where(user_id: visitor.id).first_or_create
    redirect_to @chatroom
  end

  def destroy
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
    redirect_to chatgroups_path
  end

  private

  def set_chatroom
      @chatroom = Chatroom.friendly.find(params[:chatgroup_id])
  end
end
