require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateCategories < ActiveRecord::Migration
  
  def change
  	create_table :categories do |t|
    	t.string :category
    end
  end

end
