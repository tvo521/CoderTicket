require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do
    describe '#validates_uniqueness_of' do
      it { should validate_uniqueness_of(:name) }
    end

    describe '#validates_inclusion_of' do
      before(:each) { @category = Category.new }

      context 'when category is in bound' do
        it 'should create category' do
          @category.name = 'Learning'
          expect(@category.save).to be true
        end
      end

      context 'otherwise' do
        it 'should prevent category to be saved' do
          @category.name = 'Foo'
          expect(@category.save).to be false
        end
      end
    end
  end
end
