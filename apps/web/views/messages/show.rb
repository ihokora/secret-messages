module Web::Views::Messages
  class Show
    include Web::View

    def message_decrypted_text
      message.decrypt
    end

    def message_expiration_time
      message.expiration_time
    end

    def message_visits_remains
      message.visits_remains
    end
  end
end
