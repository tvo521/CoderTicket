require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    describe '#has_secure_password' do
      it { should have_secure_password }
    end

    describe '#validates_presence_of' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
    end
  end
end
