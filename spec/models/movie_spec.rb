require 'rails_helper'

RSpec.describe Movie, :type => :model do
  describe 'relationships' do
    it { should have_many(:showtimes) }
    it { should have_many(:cinemas) }
  end

  describe '#to_s' do
    it 'return formatted string' do
      movie = Movie.new(name: "A Movie", rating:"PG-13")
      expect(movie.to_s).to eq('Movie: A Movie (Rating: PG-13)')
    end
  end

  context 'before_save' do
    describe '#fix_rating' do
      it 'fixes typo in rating' do
        movie = FactoryGirl.create(:movie, rating: 'pg-13' )
        expect(movie.reload.rating).to eq('PG13')
      end
    end
  end

end
