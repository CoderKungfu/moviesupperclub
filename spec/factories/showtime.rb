FactoryGirl.define do
  factory :showtime do
    cinema
    movie
    showtime { Time.at(rand(DateTime.now.at_beginning_of_day.to_i..DateTime.now.at_end_of_day.to_i)).to_datetime }
  end
end
