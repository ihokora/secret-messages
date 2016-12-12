require 'spec_helper'

RSpec.describe Message do

  before do
    @message = Message.new(
                          text: 'Super secret',
                          visits_remains: 2,
                          time_remains: 1 )
  end

  it 'can be initialesed with attributes' do
    expect(@message.text).to eq('Super secret')
    expect(@message.visits_remains).to eq(2)
    expect(@message.time_remains).to   eq(1)
  end

  it 'can be encrypted' do
    text = @message.text
    encrypted_text = @message.encrypt!

    expect(encrypted_text).not_to eq(text)
    expect(encrypted_text).not_to be_nil
    expect(@message.text).not_to  eq('Super secret')
  end

  it 'its text can be decrypted' do
    encrypted_text = @message.encrypt!
    plain = @message.decrypt

    expect(plain).to     eq('Super secret')
    expect(plain).not_to eq(encrypted_text)
  end

  it 'can setup expiration time' do
    @message.set_expiration_time
    expiration_time = @message.expiration_time
    created_at = @message.created_at

    expect(expiration_time).not_to be_nil
    expect(expiration_time).to be_an_instance_of(Time)
  end
end
