class Cinema < ActiveRecord::Base
  has_many :showtimes
  has_many :movies, :through => :showtimes

  GROUP_GV = 'gv'
  GROUP_CATHAY = 'cathay'
  GROUP_SHAW = 'shaw'
  GROUP_FG = 'filmgarde'

  def to_s
    "#{group.upcase} - #{name} (#{cinema_code})"
  end

  def add_showtime(movie, timing)
    showtimes.where(movie: movie, showtime: timing).first_or_create do |showtime|
      showtime.active = true
    end
  end
end
