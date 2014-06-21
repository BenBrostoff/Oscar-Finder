require_relative 'app/models/nominees.rb'
require 'pry'
class Oscars#  < ActiveRecord::Base

  attr_accessor :model
	def initialize
    @model = Nominee.all
	end

	def get_categories(year)
    hold = []
		@model.where("year = ?", year).to_a.each { |x| hold << x[:category] }
    hold.uniq
	end

end

# Nominee.all.where("year = ?", 2010).where("nom_name = ?", "True Grit").to_a.each { |x| puts x[:nom_name] + " and " + x[:won] }
ben = Oscars.new
puts ben.get_categories(2010)

class Controller

  attr_accessor :model

  def initialize
    @model = Oscars.new
  end

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
		@year = View.get_input.to_i
		if !(1929..2010).to_a.include? @year
			View.wrong_year
			year_sequence
		end
	end

	def self.category_sequence
    binding.pry
    x = @model.get_categories(@year)
		View.category_menu(x)
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

  def self.category_menu(x)
    puts x
    puts "--------------------------------------------------------------------------"
    puts
    puts "Which categorty (number) would you like to view?"
    puts "type <quit> to exit or <back> to go back to year."
  end

  def self.view_nominees(category, year)
    clear_screen

    puts "".ljust(2) + "#".ljust(2)+"|Nominee".ljust(14) + "Won?"
    puts "--------------------------------------------------------------------------"
    nominee.each_with_index{|nominee, index|
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

x = Controller.new
x.run
