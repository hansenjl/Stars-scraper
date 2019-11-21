


class CLI
  def run
    puts "Welcome to Birthdays of the Stars!!"
    Scraper.scrape_stars_birthdays
    display_stars_birthdays
    ask_for_star_choice

  end

  def ask_for_star_choice
    # tell the user to chose a Star
    puts "Choose a number between 1-#{Person.all.size} to learn more about a Star"
    # accept their input
    input = gets.chomp.to_i
    # check that their input is valid
    # if valid_input?(input)
    #   puts "Nice choice!"
    # else
    #   puts "Not a valid choice - choose 1-5"
    #   ask_for_star_choice  #recursion
    # end
    until valid_input?(input)
      puts "Not a valid choice - choose 1-5"
      input = gets.chomp.to_i
    end

    puts "Nice choice!"
    scrape_and_display_star_info(input)
  end

  def valid_input?(input)
    #their input is a number between 1-5
    input.between?(1,Person.all.size)
    #input <= 5 && input >= 1
  end

  def scrape_and_display_star_info(input)

    # find the person that corresponds with the input
    person = Person.all[input -1]
    # scrape more info about that person
    Scraper.scrape_details(person)
    # display that info
    puts person.bio
    puts "\n Born in #{person.city}"
  end


  def display_stars_birthdays
    puts "These stars have birthdays today:"
    Person.all.each.with_index(1) do |person, idx|
      puts "#{idx}. #{person.name} is turning #{person.age}"
    end
  end
end