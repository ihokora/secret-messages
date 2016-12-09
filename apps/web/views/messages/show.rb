module Web::Views::Messages
  class Show
    include Web::View

    def message_decrypted_text
      message.decrypt
    end

    def message_destruction_info
      html.div class: 'message-info' do
        message_expiration_time || message_visits_remains
      end

    end

    def message_expiration_time
      if message.expiration_time
        p "Message will be destroyed at: #{message.expiration_time}"
      end
    end

    def message_visits_remains
      if message.visits_remains
        p "Views left: #{message.visits_remains}"
      end
    end
  end
end
