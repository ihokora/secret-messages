module Web::Controllers::Messages
  class Show
    include Web::Action

    before :destroy_expired

    expose :message

    def call(params)
      @message = find_message
      @message.subtract_visit if @message&.visits_remains
      destroy_expired
    end

    private

      def find_message
        id = Message.decrypt_id(params[:id])
        MessageRepository.new.find(id)
      end

      def destroy_expired
        id = Message.decrypt_id(params[:id])
        message = MessageRepository.new.find(id)
        MessageRepository.new.delete(message.id) if message&.expired?
      end

  end
end
