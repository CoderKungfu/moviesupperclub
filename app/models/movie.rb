class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :cinemas, :through => :showtimes

  def to_s
   "Movie: #{name} (Rating: #{rating})"
  end
end
