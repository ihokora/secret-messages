require 'features_helper'

RSpec.describe 'Add message' do
  after do
    MessageRepository.new.clear
  end

  it 'can create a new message' do
    visit '/messages/new'

    fill_in 'text-input', with: 'This is super-secret message'
    fill_in 'visit-input', with: 3
    fill_in 'time-input', with: 2

    click_button 'Create'
  end

  #expect(current_path).to eq('/messages')
end
