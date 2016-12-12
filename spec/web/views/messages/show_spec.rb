require 'spec_helper'
require_relative '../../../../apps/web/views/messages/show'

RSpec.describe Web::Views::Messages::Show do
  let(:exposures) { Hash[message: nil] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/messages/show.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #message' do
    expect(view.message).to eq exposures.fetch(:message)
  end

  describe 'when there are no message' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder">Sorry.. It seems this message has been destroyed!</p>')
    end
  end

end
