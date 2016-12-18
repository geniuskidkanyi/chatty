module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
        self.current_user = find_verified_visitor
        logger.add_tags 'ActionCable', "User #{current_user.id}"
    end

    protected

    def find_verified_visitor
        if current_user = Visitor.find_by(id: cookies.signed[:visitor_id])
            current_user
        else
            reject_unauthorized_connection

      end
    end
  end
end
