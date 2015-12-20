require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with HTTP 200 code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all events' do
      events = create_list(:event, 2)
      get :index
      expect(assigns(:events).count).to eq(events.count)
    end
  end

  describe 'GET #show' do
    before(:all) { @event = create(:event) }
    before(:each) { get :show, id: @event.id }

    it 'responds successfully with HTTP 200 code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('show')
    end

    it 'loads correct event' do
      expect(assigns(:event).name).to eq(@event.name)
    end
  end
end
