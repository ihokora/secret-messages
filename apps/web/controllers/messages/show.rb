module Web::Controllers::Messages
  class Show
    include Web::Action

    before :find_message, :private_link

    expose :message, :private_link

    def call(params)

    end

    private

      def find_message
        id = Message.decrypt_id(params[:id])
        @message = MessageRepository.new.find(id)
      end

      def private_link
        @private_link = routes.messages_path + "/" + @message.private_id
      end
  end
end
