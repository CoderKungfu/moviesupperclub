require 'open-uri'

class GvScrapper < Scrapper
  def initialize
    @main_url = 'http://www.gv.com.sg/buyTickets.jsp'
    @showtime_url = 'http://www.gv.com.sg/buyTickets2.jsp?loc=%s&date=%s'
  end

  def get_showtimes(today=Date.today)
    doc = parse_main_page

    doc.css('div[id^=tabPanelWrapperBuy]').each do |cinema|
      cinema_code = cinema['id'][/tabPanelWrapperBuy([0-9]{0,2})/, 1]
      cinema_name = cinema.css('strong.tabyellow').first.content.strip

      c = fetch_cinema(Cinema::GROUP_GV, cinema_name, cinema_code)
      SCRAPPER_LOGGER.debug "#{c}"

      (today .. today + 6.days).each do |d|
        showtimes = parse_showtime_page(c.cinema_code, d)
        showtimes.css('tr').each do |tr|
          showtime_links = tr.css('a.showtimes')
          next unless showtime_links.any?

          movie_name_link = showtime_links.shift
          movie_name = movie_name_link.content.strip
          rating = tr.css('td.rating').first.content

          m = fetch_movie(movie_name, rating)
          SCRAPPER_LOGGER.debug "#{m}"

          showtime_links.each do |link|
            time = link.content.strip
            if time.include? 'AM'
              date = (d + 1.day).strftime "%d-%m-%Y"
            end
            timing = DateTime.parse("#{date} #{time} +08:00")
            t = c.showtimes.where(
                  movie: m, showtime: timing
                ).first_or_create
                SCRAPPER_LOGGER.debug "#{t}"
          end
        end

        SCRAPPER_LOGGER.debug '===================='
      end
    end
  end

  def parse_main_page
    Nokogiri::HTML(open(@main_url))
  end

  def parse_showtime_page(cinema_code, date)
    date_str = date.strftime "%d-%m-%Y"
    showtime_url = @showtime_url % [cinema_code, date_str]
    Nokogiri::HTML(open(showtime_url))
  end
end
