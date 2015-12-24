require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    before(:all) do
      Event.destroy_all
      @events = create_list(:event, 2)
    end

    it 'responds successfully with HTTP 200 code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    context 'when user searches' do
      it 'should load specific events' do
        post :index, search: @events.first.name
        expect(assigns(:events).first.name).to eq(@events.first.name)
      end
    end

    context 'when user does not search' do
      it 'should load all events' do
        get :index
        expect(assigns(:events).count).to eq(2)
      end
    end
  end

  describe 'GET #show' do
    before(:each) do
      @event = create(:event)
      get :show, id: @event.id
    end

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
