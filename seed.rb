
require_relative 'app/models/oscars.rb'
require_relative 'app/models/categories.rb'
require_relative 'app/models/nominees.rb'
require 'active_record'
require 'CSV'

rows = CSV.read('academy_awards.csv', :headers => true) 

nom_array = []

rows.each do |row|
  nom_array << { year:row['Year'].to_i, category: row['Category'], nom_name: row['Nominee'], won: row ['Won?'] }
end


nom_array.each do |year|
  Nominee.new(year).save
end



