module Web::Controllers::Messages
  class Create
    include Web::Action

    before :prepare_message

    def call(params)
      redirect_to private_link
    end


    private

      def prepare_message
        @message = Message.new(params[:message])
        @message.encrypt
        @message = MessageRepository.new.create(@message)
      end

      def private_link
        encrypted_id = @message.encrypt_id
        routes.messages_path + "/" + encrypted_id
      end



  end
end
