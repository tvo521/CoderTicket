require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
    before(:each) { @user = build(:user) }

    context 'when user signs up successfully' do
      it 'should create user and assign user id to session' do
        post :create, user: {name: @user.name, email: @user.email, password: @user.password, password_confirmation: @user.password_confirmation}
        expected_user = User.find_by(email: @user.email)
        expect(expected_user.name).to eq(@user.name)
        expect(session[:user_id]).to eq(expected_user.id)
        expect(subject).to redirect_to(root_path)
      end
    end

    context 'otherwise' do
      it 'should render new template' do
        post :create, user: {email: @user.email, password: @user.password, password_confirmation: @user.password_confirmation}
        expect(response).to render_template('new')
      end
    end
  end
end
