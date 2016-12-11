require 'features_helper'

RSpec.describe 'Add message' do
  after do
    MessageRepository.new.clear
  end

  it 'can create a new message' do
    visit '/messages/new'

    fill_in 'text_input', with: 'This is super-secret message'
    click_on 'visits_panel'
    fill_in 'visit_input', with: 3
    fill_in 'time_input', with: 2

    click_button 'Create'
  end

  #expect(current_path).to eq('/messages')
end
