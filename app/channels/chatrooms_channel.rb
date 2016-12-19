# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatroomsChannel < ApplicationCable::Channel
  include ActionController::Helpers
  include ActionController::Cookies
  helper_method :current_user
  def subscribed
    current_user.chatrooms.each do |chatroom|

        stream_from "chatrooms:#{chatroom.id}"
    end

  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    # Rails.logger.info data
    @chatroom = Chatroom.find(data["chatroom_id"])
    message   = @chatroom.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
  def current_user
    @current_user ||= Chatroom.find cookies.signed[:visitor_id] if cookies.signed[:visitor_id]
    if @current_user
      @current_user
    else
      @visitor =  Visitor.create!(location: "request.remote_ip", ip: "request.remote_ip")
      log_in @visitor
      @chatroom = Chatroom.create!(name: @visitor.location)
      @chatroom_user = @chatroom.chatroom_users.where(user_id: visitor.id).first_or_create
    end
  end

  def log_in(visitor)
    session[:visitor_id] = visitor.id
  end

end
