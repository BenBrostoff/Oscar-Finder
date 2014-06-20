require 'CSV'

# puts "TEST"

# ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
# valid_string = ic.iconv(untrusted_string)

rows = CSV.read('academy_awards_final.csv')
p rows 