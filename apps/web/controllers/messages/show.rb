module Web::Controllers::Messages
  class Show
    include Web::Action

    before :find_message

    expose :message

    def call(params)

    end

    private

      def find_message
        id = Message.decrypt_id(params[:id])
        @message = MessageRepository.new.find(id)
      end

  end
end
