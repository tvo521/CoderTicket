require 'rails_helper'

RSpec.describe Venue, type: :model do
  it { should belong_to(:region) }

  context 'validations' do
    describe '#validates_uniqueness_of' do
      it { should validate_uniqueness_of(:name) }
    end
  end
end
