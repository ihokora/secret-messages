module Web::Controllers::Messages
  class Show
    include Web::Action

    expose :message

    def call(params)
      @message = MessageRepository.new.find(params[:id])
    end
  end
end
