class Scrapper
  def fetch_cinema(group, cinema_name, cinema_code)
    Cinema.where(group: group, name: cinema_name).first_or_create do |cinema|
      cinema.cinema_code = cinema_code
      cinema.active = true
    end
  end

  def fetch_movie(movie_name, rating)
    Movie.where(name: movie_name).first_or_create do |movie|
      movie.rating = rating
    end
  end
end
