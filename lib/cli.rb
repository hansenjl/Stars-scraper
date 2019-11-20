
require 'pry'

class CLI
  def run
    puts "Welcome to Birthdays of the Stars!!"
    Scraper.scrape_stars_birthdays
    display_stars_birthdays

  end


  def display_stars_birthdays
    puts "These stars have birthdays today:"
    Person.all.each.with_index(1) do |person, idx|
      puts "#{idx}. #{person.name} is turning #{person.age}"
    end
  end
end