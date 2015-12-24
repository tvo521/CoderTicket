require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:event) { create(:event) }

  describe 'GET #new' do
    before(:each) { get :new, event_id: event.id }

    it 'responds successfully with HTTP 200 code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('new')
    end

    it 'loads correct event' do
      expect(assigns(:event).name).to eq(event.name)
    end
  end
end
