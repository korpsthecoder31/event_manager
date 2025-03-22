require 'csv'

puts 'Event Manager Initialized!'
puts ''

# CHECKS IF FILE EXISTS
# exist = File.exist? 'event_attendees.csv'
# puts exist

# READS ENTIRE FILE
# contents = File.read('event_attendees.csv')
# puts contents

# READS FILE LINE BY LINE
# file = 'event_attendees.csv'

# lines = File.readlines(file) 
# lines.each_with_index do |line, index|
#   next if index == 0
#   columns = line.split(",")
#   first_names = columns[2]
#   puts first_names
# end

# INITIAL CLEAN ZIP CODE METHOD
# def clean_zip_code(zipcode)
#   if zipcode == nil
#     zipcode = '00000'
#   elsif zipcode.length > 5
#     zipcode = zipcode[0..4]
#   else zipcode.length < 5
#     zipcode = zipcode.rjust(5, '0')
#   end
# end

def clean_zip_code(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

contents = CSV.open(
  'event_attendees.csv', 
  headers: true, 
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  
  zipcode = clean_zip_code(row[:zipcode])

  puts "#{name} #{zipcode}"
end
