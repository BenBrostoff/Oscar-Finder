
require_relative 'app/models/oscars.rb'
require_relative 'app/models/categories.rb'
require_relative 'app/models/nominees.rb'
require 'CSV'

CSV.foreach('academy_awards.csv', headers: true) do |row|
  puts row.to_hash
end



# List.new({name: "Shit I gotta do."}).save

# 20.times do
#   Task.new({text: Faker::Lorem.sentence, list_id: 1}).save
# end