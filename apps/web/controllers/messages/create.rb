module Web::Controllers::Messages
  class Create
    include Web::Action

    before :prepare_message

    def call(params)
      redirect_to routes.message_path(id: @message.private_id)
    end


    private

      def prepare_message
        message = Message.new(params[:message])
        message.encrypt!
        message.set_expiration_time if message.time_remains
        @message = MessageRepository.new.create(message)
      end

  end
end
