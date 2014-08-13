require 'rails_helper'

RSpec.describe Scrapper do
  let(:group) { Cinema::GROUP_GV }
  let(:cinema_name) { 'GV Bishan' }
  let(:cinema_code) { '60' }
  let(:movie_name) { 'Guardians of the Galaxy' }
  let(:rating) { 'PG-13' }

  describe '#fetch_cinema' do
    it 'creates a new cinema' do
      expect{ subject.fetch_cinema(group, cinema_name, cinema_code) }.to change { Cinema.count }.by(1)
    end

    it 'returns existing cinema' do
      subject.fetch_cinema(group, cinema_name, cinema_code)
      expect{ subject.fetch_cinema(group, cinema_name, cinema_code) }.to_not change { Cinema.count }

      cinema = subject.fetch_cinema(group, cinema_name, cinema_code)
      expect(cinema.name).to eq(cinema_name)
    end
  end

  describe '#fetch_movie' do
    it 'creates a new movie' do
      expect{ subject.fetch_movie(movie_name, rating) }.to change { Movie.count }.by(1)
    end

    it 'returns existing movie' do
      subject.fetch_movie(movie_name, rating)
      expect{ subject.fetch_movie(movie_name, rating) }.to_not change { Movie.count }

      movie = subject.fetch_movie(movie_name, rating)
      expect(movie.name).to eq(movie_name)
    end

    context 'misspelt name' do
      let(:wrong_movie_name) { 'The Guardians of the Galaxy' }
      let(:correct_movie_name) { 'Guardians of the Galaxy' }

      before do
        MovieNameLookup.create(name: correct_movie_name, misspelt: wrong_movie_name)
      end

      it 'returns correct movie name' do
        movie = subject.fetch_movie(wrong_movie_name, rating)
        expect(movie.name).to eq(correct_movie_name)
      end
    end
  end

end
