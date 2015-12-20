require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = create(:event, :with_ticket_types)
    assign(:event, @event)
    render
  end

  it 'displays number of ticket types correctly' do
    expect(rendered).to have_css('div.sidebar .ticket-list .pull-left', count: 3)
  end

  it 'has booking link' do
    expect(rendered).to have_xpath("//a[contains(@href,#{new_event_ticket_path(@event)})]")
  end

  it 'displays event content' do
    expect(rendered).to have_css('div.event-content .container h3', text: @event.name)
    expect(rendered).to have_css('div.event-content .container .time-details', text: @event.starts_at.strftime('%A, %d %b %Y %l:%M %p'))
    expect(rendered).to have_css('div.event-content .container .venue-details', text: /[#{@event.venue.name}](.+)[#{@event.venue.full_address}]/i)
    expect(rendered).to have_css('div.event-content .container .extended-description', text: @event.extended_html_description.html_safe)
  end
end
