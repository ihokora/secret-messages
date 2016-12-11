RSpec.describe Message do

  it 'can be initialesed with attributes' do
    message = Message.new(
                          text: 'I am encrypted text',
                          visits_remains: 2,
                          time_remains: 1 )
    expect(message.text).to eq('I am encrypted text')
    expect(message.visits_remains).to eq(2)
    expect(message.time_remains).to eq(1)
  end

end
