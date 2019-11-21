

class Scraper

  def self.scrape_stars_birthdays
    site = "https://www.imdb.com"
    html = open(site)
    doc = Nokogiri::HTML(html)
    array_of_stars =  doc.css('div.widget_caption.caption_below').css('div.primary')
    array_of_stars.each do |section|
      name_and_age = section.text
      info_array = name_and_age.strip.split(" (")
      name = info_array[0]
      age = info_array[1].chop
      url = site + section.css('a')[0]['href']
      Person.new(name, age, url)
    end
  end

  def self.scrape_details(person_obj)
      html = open(person_obj.url)
      doc = Nokogiri::HTML(html)
      person_obj.bio = doc.css('#name-bio-text div div.inline').text.strip.gsub("See full bio »", "").strip
      person_obj.city = doc.css('#name-born-info a').last.text
  end
end