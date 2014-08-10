require 'rails_helper'

RSpec.describe GvScrapper do
  describe '#initialize' do
    it 'initializes' do
      expect(subject).to_not be_nil
    end

    let(:buy_ticket_url) { 'http://www.gv.com.sg/buyTickets.jsp' }
    let(:showtime_url) { 'http://www.gv.com.sg/buyTickets2.jsp?loc=%s&date=%s' }
    it 'assigns instance variables' do
      expect(subject.instance_variable_get(:@main_url)).to eq(buy_ticket_url)
      expect(subject.instance_variable_get(:@showtime_url)).to eq(showtime_url)
    end
  end

  describe '#parse_main_page', :vcr do
    it 'fetches the url' do
      expect(subject.parse_main_page).to be_a(Nokogiri::HTML::Document)
    end
  end

  describe '#parse_showtime_page', :vcr do
    let(:cinema_code) { '03' }
    let(:show_date) { Date.parse('2014-08-03 12:00:00 +08:00') }

    it 'fetches the url' do
      expect(subject.parse_showtime_page(cinema_code, show_date)).to be_a(Nokogiri::HTML::Document)
    end
  end

  describe '#get_showtimes', :vcr do
    let(:start_date) { Date.parse('2014-08-03 12:00:00 +08:00') }

    it 'returns a hash' do
      # expect_any_instance_of(GvScrapper).to receive(:logger).at_least(:once)
      subject.get_showtimes(start_date)
    end
  end
end


