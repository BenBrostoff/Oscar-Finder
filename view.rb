class View
  def self.get_input
    gets.strip
  end

  def self.welcome
    puts "Welcome to the Oscars!!"
    puts "Where you can view all of the categories, nominees, and winners every year!"
  end

  def self.year
    puts "--------------------------------------------------------------------------"
    puts
    puts "Enter the Oscar year of interest. (1929-2010)"
    puts "or type <quit> to exit"
  end

  def self.category_menu
    puts categories # CATEGORIES TABLE
    puts "--------------------------------------------------------------------------"
    puts
    puts "Which categorty (number) would you like to view?"
    puts "type <quit> to exit or <back> to go back to year."
  end

  def self.view_nominees(category, year)
    clear_screen

    puts "".ljust(2) + "#".ljust(2)+"|Nominee".ljust(14) + "Won?"
    puts "--------------------------------------------------------------------------"
    nominees.each_with_index{|nominee, index|
      print "".ljust(2) + "#{index + 1}".ljust(2)+"|#{nominee.name}".ljust(14)+"#{nominee.won}"
      puts
    }
  end

  def self.nominees_menu
    clear_screen

    puts "--------------------------------------------------------------------------"
    puts
    puts "Which nominee (by number) would you like to get more information on?"
    puts "type <quit> to exit or <back> to go back to category."
  end

  def self.nominees_information
    clear_screen

    puts nominee.add_info
    puts "--------------------------------------------------------------------------"
    puts
    puts "type <quit> to exit or <back> to go back to nominees"
  end

  def self.clear_screen
    system('clear')
  end
end
