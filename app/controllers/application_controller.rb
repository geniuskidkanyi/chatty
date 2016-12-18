class ApplicationController < ActionController::API
  include ActionController::Helpers
  include ActionController::Cookies
  acts_as_token_authentication_handler_for User
  helper_method :current_user

  def current_user
    @current_user ||= Chatroom.find session[:visitor_id] if session[:visitor_id]
    if @current_user
      @current_user
    else
      @visitor =  Visitor.create!(location: request.remote_ip, ip: request.remote_ip)
      log_in @visitor
      @chatroom = Chatroom.create!(name: @visitor.location)
      @chatroom_user = @chatroom.chatroom_users.where(user_id: visitor.id).first_or_create
    end
  end

  def log_in(visitor)
    session[:visitor_id] = visitor.id
  end
  # include DeviseTokenAuth::Concerns::SetUserByToken
end
