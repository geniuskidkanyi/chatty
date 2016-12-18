# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    chatrooms.each do |chatroom|

        stream_from "chatrooms:#{chatroom.id}"
    end

  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    # Rails.logger.info data
    @chatroom = chatroom.find(data["chatroom_id"])
    message   = @chatroom.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
