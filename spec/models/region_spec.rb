require 'rails_helper'

RSpec.describe Region, type: :model do
  context 'validations' do
    describe '#validates_uniqueness_of' do
      it { should validate_uniqueness_of(:name) }
    end

    describe '#validates_inclusion_of' do
      before(:each) { @region = Region.new }

      context 'when region is in bound' do
        it 'should create region' do
          @region.name = 'Ha Noi'
          expect(@region.save).to be true
        end
      end

      context 'otherwise' do
        it 'should prevent region to be saved' do
          @region.name = 'Foo'
          expect(@region.save).to be false
        end
      end
    end
  end
end
