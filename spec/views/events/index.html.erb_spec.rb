require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  before(:all) { @events = create_list(:event, 2) }

  it 'renders _event partial for each event' do
    assign(:events, @events)
    render
    expect(view).to render_template(:partial => '_card', :count => 2)
  end
end
