require 'rails_helper'

RSpec.describe Showtime, :type => :model do
  describe 'relationships' do
    it { should belong_to(:cinema) }
    it { should belong_to(:movie) }
  end

  describe '#to_s' do
    let(:cinema) { Cinema.new(name: 'Orchard Cineleisure', group: Cinema::GROUP_GV, cinema_code: 'ORCH1') }
    let(:movie) { Movie.new(name: "A Movie", rating:"PG-13") }

    it 'to return formatted string' do
      showtime = Showtime.new(cinema:cinema, movie:movie, showtime: DateTime.parse('2014-08-02 12:00:00 +08:00'))

      expect(showtime.to_s).to eq('Cinema: Orchard Cineleisure | Time: 02-08-2014 12:00pm | Movie: A Movie')
    end

    it 'to return formatted string' do
      showtime = Showtime.new(cinema:cinema, movie:movie)

      expect(showtime.to_s).to eq('Cinema: Orchard Cineleisure | Time: nil | Movie: A Movie')
    end
  end
end
