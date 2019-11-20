require 'open-uri'
require 'nokogiri'

class Scraper

  def self.scrape_stars_birthdays
    site = "https://www.imdb.com/"
    html = open(site)
    doc = Nokogiri::HTML(html)
    array_of_stars =  doc.css('div.widget_caption.caption_below').css('div.primary')
    array_of_stars.each do |section|
      name_and_age = section.text
      info_array = name_and_age.strip.split(" (")

      Person.new(info_array[0], info_array[1].chop)
    end
  end
end