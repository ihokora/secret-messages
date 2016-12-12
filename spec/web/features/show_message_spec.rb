require 'features_helper'

RSpec.describe 'Show message' do
  let(:repository) { MessageRepository.new }

  before do
    @message = Message.new(text: 'Super secret',
                           visits_remains: 2,
                           time_remains: 1 )
    @message.encrypt!
    repository.clear
    @message = repository.create(@message)
  end

  it 'shows the message on the page' do
    visit '/messages/' + @message.private_id

    within '.jumbotron' do
      expect(page).to have_css '.message'
   end
  end

  it 'shows message text and info on the page' do
    visit '/messages/' + @message.private_id

    expect(page.body).to include('Super secret')
    expect(page.body).to include('Views')
    expect(page.body).to include('Link')
  end

end
