require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateNominees < ActiveRecord::Migration
  
  def change
  	create_table :nominees do |t|
    	t.integer :year  #named oscars_id 
      t.string :category #named categories_id
      t.string :nom_name
      t.string :won
    end
  end

end
