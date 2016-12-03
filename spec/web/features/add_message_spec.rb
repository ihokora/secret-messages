require 'features_helper'

RSpec.describe 'Add message' do
  after do
    MessageRepository.new.clear
  end

  it 'can create a new message' do
    visit '/messages/new'

    fill_in 'Text',             with: 'This is super-secret message'
    fill_in 'Visits remaining', with: 3

    click_button 'Create'
  end

  #expect(current_path).to eq('/messages')
end
