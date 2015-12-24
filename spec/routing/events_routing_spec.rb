require 'rails_helper'

RSpec.describe 'Events Routing', type: :routing do
  it 'routes /events/search to events#index' do
    expect(post: '/events/search', search: 'Event Name').to route_to(controller: 'events', action: 'index')
  end
end
