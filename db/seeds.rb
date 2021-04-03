# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require "open-uri"
puts "Destroying all locations..."
Location.destroy_all

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'lib/natural_wines.csv'
CSV.foreach(filepath, csv_options) do |row|

  p row['Photo_url']
    file = URI.open(row['Photo_url'])
    regex_jpg = /jpg/
    if regex_jpg.match(row['Photo_url'])
      photo_filename = 'nes.jpg'
      photo_content_type = 'image/jpg'
    else
    photo_filename = 'nes.png'
    photo_content_type = 'image/png'
  end
  puts "Creating locations..."
    # if statement to assign correct value for filename & content_type

  location = Location.new(
    name: row['Name'],
    address: row['Address'],
    category: row['Category'],
    photo: row['Photo_url']
  )
  location.photo.attach(io: file, filename: photo_filename, content_type: photo_content_type)
  location.save!
  puts "Creating location #{location.id}..."
end

puts "Finished !"
