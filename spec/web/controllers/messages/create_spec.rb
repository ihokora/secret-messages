require 'spec_helper'
require_relative '../../../../apps/web/controllers/messages/create'

RSpec.describe Web::Controllers::Messages::Create do
  let(:action) { Web::Controllers::Messages::Create.new }
  let(:params) { Hash[message: {text: "secret", visits_remains: 1, time_remains: 1}] }

  before do
    MessageRepository.new.clear
  end

  it 'creates a new message' do
    action.call(params)

    expect(action.message.id).not_to be_nil
    expect(action.message.decrypt).to eq(params[:message][:text])
    expect(action.message.visits_remains).to eq 1
    expect(action.message.time_remains).to eq 1
  end

  it 'redirects the user after creates message' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end
end
