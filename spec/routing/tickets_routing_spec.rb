require 'rails_helper'

RSpec.describe 'Tickets Routing', type: :routing do
  it 'routes nested new_event_ticket to tickets#new' do
    event = create(:event)
    expect(get: "/events/#{event.id}/tickets/new").to route_to(controller: 'tickets', action: 'new', event_id: "#{event.id}")
  end
end
