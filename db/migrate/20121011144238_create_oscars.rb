require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateOscars < ActiveRecord::Migration
  
  def change
  	create_table :oscars do |t|
    	t.integer :year
    end
  end

end
