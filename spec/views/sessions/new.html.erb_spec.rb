require 'rails_helper'

RSpec.describe "sessions/new", type: :view do
  before(:all) { @user = create(:user) }

  it 'renders _form partial' do
    assign(:user, @user)
    render
    expect(view).to render_template(:partial => '_form', :count => 1)
  end
end
