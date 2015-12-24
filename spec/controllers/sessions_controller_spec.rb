require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    before(:each) { get :new }

    it 'responds successfully with HTTP 200 code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('new')
    end

    it 'creates new user' do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    before(:all) { @user = create(:user) }

    context 'when user has signed up' do
      it 'should assign user id to session' do
        post :create, user: {email: @user.email, password: 'Foo'}
        expect(session[:user_id]).to eq(@user.id)
        expect(flash[:error]).to eq(nil)
      end
    end

    context 'otherwise' do
      it 'should have flash error message' do
        post :create, user: {email: 'Blah', password: 'Foo'}
        expect(session[:user_id]).to eq(nil)
        expect(flash[:error]).to eq('Email or password is incorrect.')
      end
    end

    after(:each) { expect(subject).to redirect_to(root_path) }
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @user = create(:user)
      post :create, user: {email: @user.email, password: 'Foo'}
    end

    it 'refreshes session and assigns flash message' do
      delete :destroy, id: @user.id
      expect(session[:user_id]).to eq(nil)
      expect(flash[:success]).to eq('Logout successfully.')
      expect(subject).to redirect_to(root_path)
    end
  end
end
