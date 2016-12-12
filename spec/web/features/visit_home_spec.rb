require 'features_helper'

RSpec.describe 'Visit home' do
  it 'is successful' do
    visit '/'

    expect(page.title).to eq('Secret Messages')
  end

  it 'have input fields for new message' do
    visit '/'

    expect(page).to have_css '#text-input'
    expect(page).to have_css '#time-input'
    expect(page).to have_css '#visit-input'
  end

  it 'have submit button' do
    visit '/'

    expect(page).to have_css '.controls'
  end

end
