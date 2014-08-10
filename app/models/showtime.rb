class Showtime < ActiveRecord::Base
  belongs_to :cinema
  belongs_to :movie
  has_and_belongs_to_many :tags

  def self.by_date(date)
    where(showtime: ((date.midnight + 7.hours) .. (date.midnight + 1.day + 7.hours)))
  end

  def to_s
    if showtime.nil?
      "Cinema: #{cinema.name} | Time: nil | Movie: #{movie.name}"
    else
      "Cinema: #{cinema.name} | Time: #{showtime.to_time.strftime "%d-%m-%Y %I:%M%P"} | Movie: #{movie.name}"
    end
  end
end
