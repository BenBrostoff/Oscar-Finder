#class Oscars < ActiveRecord::Base
#	def initialize 
#
#
#	end
#
#	def year
#		Oscars.where(year: "#{user_input}")
#
#	
#	end	
#
#end

class Controller
	# attr_accessor :category_option, :year
	def self.run
		start
		year_sequence 
		category_sequence unless @year == 'quit'
		nominee_sequence unless @category_option == 'quit'
	end

	def self.start
		View.welcome
	end

	def self.year_sequence
		View.get_year
		@year = View.get_input
		if !(1929..2010).to_a.include? @year.to_i
			View.wrong_year
			year_sequence
		end
	end

	def self.category_sequence	
		View.category_menu
		@category_option = View.get_input
		if @category_option == 'back'
			year_sequence 
		# elsif @category_option 
		end	
	end 

	def self.nominee_sequence
		View.view_nominees(@category_option, @year)
		@nominee_option = View.get_input
		if @nominee_option == 'back'
			category_sequence
		elsif @nominee_option == 'quit'
			return
		end	
	end
end 


class View
  def self.get_input
    gets.strip
  end

  def self.wrong_year
  	puts
  	puts "Invalid Year, select another."
  end

  def self.welcome
    puts "Welcome to the Oscars!!"
    puts "Where you can view all of the categories, nominees, and winners every year!"
  end

  def self.get_year
  	puts
    puts "--------------------------------------------------------------------------"
    puts
    puts "Enter the Oscar year of interest. (1929-2010)"
    puts "or type <quit> to exit"
  end

  def self.category_menu
    #puts categories # CATEGORIES TABLE
    puts
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

    puts "--------------------------------------------------------------------------"
    puts "type <quit> to exit or <back> to go back to category."
  end

  def self.clear_screen
    system('clear')
  end

end

Controller.run