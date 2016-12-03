RSpec.describe Message do

  it 'can be initialesed with attributes' do
    message = Message.new(
                          encrypted_text: 'I am encrypted text',
                          visits_remaining: 2,
                          expiration_time: 1 )
    expect(message.encrypted_text).to eq('I am encrypted text')
    expect(message.visits_remaining).to eq(2)
    expect(message.expiration_time).to be_an_instance_of(Time)
  end

end
