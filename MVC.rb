require_relative 'app/models/nominees.rb'
require 'pry'
class Oscars

  attr_accessor :model

	def initialize
    @model = Nominee.all
	end

	def get_categories(year)
    hold = []
		@model.where("year = ?", year).to_a.each { |x| hold << x[:category] }
    hold.uniq
	end

  def get_nominees(year, category)
    noms = @model.where("year = ?", year).where("category = ?", category)
  end

  def nom_array(year, category)
    hold = []
    self.get_nominees(year, category).to_a.each { |x| hold << x[:nom_name] }
    hold
  end

  def winner(year, category, won = "YES")
    winner = get_nominees(year, category).where("won = ?", "YES")
  end

  def winner_array(year, category)
    hold = []
    self.winner(year, category).to_a.each { |x| hold << x[:nom_name] }
    hold
  end

end

class Controller

  attr_accessor :noms, :year, :category_option

  def initialize
    @noms = Oscars.new
    @year = 0
    @category_option = ""
  end

	def run
		start
		year_sequence
		category_sequence unless @year == 'quit'
		nominee_sequence unless @category_option == 'quit'
	end

	def start
		View.welcome
	end

	def year_sequence
		View.get_year
		@year = View.get_input.to_i
		if !(1929..2010).to_a.include? @year
			View.wrong_year
			year_sequence
		end
	end

	def category_sequence
    x = @noms.get_categories(@year)
    #binding.pry
		View.category_menu(x)
		@category_option = View.get_input
		if @category_option == 'back'
			year_sequence
		else
      nominee_sequence
		end
	end

	def nominee_sequence
    x = noms.nom_array(@year, @category_option)
		View.view_nominees(x)
		@nominee_option = View.get_input
		if @nominee_option == 'back'
			category_sequence
		else
      winner_sequence
		end
	end

  def winner_sequence
    x = noms.winner_array(@year, @category_option)
    View.view_winner(x)
  end

end


class View

  def self.star
    puts "*" * 50
  end

  def self.get_input
    gets.strip
  end

  def self.wrong_year
  	puts
  	puts "Invalid Year, select another."
  end

  def self.welcome
    system('clear')
    puts "Welcome to the Oscar Finder"
    View.star
    puts "Wondering who won what in what year? Look no further!"
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
    puts "Which category would you like to view?"
    puts "type <quit> to exit or <back> to go back to year."
  end

  def self.view_nominees(x)
    clear_screen
    puts "The nominees are as follows: "
    puts x

    # puts "".ljust(2) + "#".ljust(2)+"|Nominee".ljust(14) + "Won?"
    # puts "--------------------------------------------------------------------------"
    # nominee.each_with_index{|nominee, index|
    #   print "".ljust(2) + "#{index + 1}".ljust(2)+"|#{nominee.name}".ljust(14)+"#{nominee.won}"
    #   puts
    # }

    puts "--------------------------------------------------------------------------"
    puts "type <quit> to exit or <back> to go back to category."
  end

  def self.view_winner(x)
    puts "And the winner is... "
    puts x 
  end

  def self.clear_screen
    system('clear')
  end

end

x = Controller.new
# binding.pry
x.run
