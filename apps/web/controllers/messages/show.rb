module Web::Controllers::Messages
  class Show
    include Web::Action

    before :destroy_message_if_expired

    expose :message

    def call(params)
      find_message
      @message.subtract_visit   if @message&.visits_remains
    end

    private

      def find_message
        id = Message.decrypt_id(params[:id])
        @message = MessageRepository.new.find(id)
      end

      def destroy_message_if_expired
        find_message
        MessageRepository.new.delete(@message.id) if @message&.expired?
      end

  end
end
