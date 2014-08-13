require 'rails_helper'

RSpec.describe MovieNameLookup, :type => :model do
  describe '#check_name' do
    let(:correct_name) { 'The Awakening' }
    let(:wrong_name) { 'Awakening, The' }

    before do
      MovieNameLookup.create(name: correct_name, misspelt: wrong_name)
    end

    it 'returns correct name' do
      expect(MovieNameLookup.check_name(wrong_name)).to eq(correct_name)
    end

    it 'returns the name passed in' do
      expect(MovieNameLookup.check_name(correct_name)).to eq(correct_name)
    end

  end
end
