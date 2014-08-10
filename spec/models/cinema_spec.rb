require 'rails_helper'

RSpec.describe Cinema, :type => :model do
  describe 'relationships' do
    it { should have_many(:showtimes) }
    it { should have_many(:movies) }
  end

  let(:name) { 'Orchard Cineleisure' }
  let(:group) { Cinema::GROUP_GV }
  let(:cinema_code) { '60' }

  subject { Cinema.new(name: name, group: group, cinema_code: cinema_code) }

  describe '#to_s' do
    it 'returns formatted text' do
      expect(subject.to_s).to eq('GV - Orchard Cineleisure (60)')
    end
  end

  describe '#add_showtime' do
    let(:movie) { Movie.create(name: 'Book Mah', rating: 'PG-13')  }
    let(:showtime) { DateTime.parse('2014-08-06 12:00pm +08:00') }
    it 'adds showtime' do
      expect{ subject.add_showtime(movie, showtime) }.to change{ Showtime.count }.by(1)
    end
  end
end
