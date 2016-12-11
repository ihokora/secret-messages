require_relative '../../../../apps/web/controllers/messages/show'

RSpec.describe Web::Controllers::Messages::Show do

  before do
    @message = Message.new(text: "secret",
                           visit_remains: 2,
                           time_remains: 1)
    @message.encrypt!
    @message = MessageRepository.new.create(@message)
  end

  let(:action) { described_class.new }


  it 'is successful' do
    response = action.call(id: @message.private_id)
    expect(response[0]).to eq 200
  end
end
