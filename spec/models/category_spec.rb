require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do
    describe '#validates_uniqueness_of' do
      it { should validate_uniqueness_of(:name) }
    end

    describe '#validates_inclusion_of' do
      it { should validate_inclusion_of(:name).in_array(['Entertainment', 'Learning', 'Everything Else']) }
    end
  end
end
