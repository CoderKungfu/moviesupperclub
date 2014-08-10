class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :cinemas, :through => :showtimes

  before_save :fix_rating
  validates :name, :rating, presence: true

  def to_s
   "Movie: #{name} (Rating: #{rating})"
  end

  def fix_rating
    self.rating = KNOWN_RATING_TYPOS.values_at(self.rating.upcase).first
  end

end
