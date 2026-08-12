require "csv"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Item.destroy_all
Category.destroy_all

# Reset the id values for the database
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='items';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='categories';")

csv_file = Rails.root.join('db/items.csv')
csv_data = File.read(csv_file)

# items = CSV.parse(csv_data, headers: true)

# If CSV was created by Excel in Windows you may also need to set an encoding type:
items = CSV.read(csv_file, headers: true, encoding: "bom|utf-8")


items.each do |item|
  # Create categories and items and order items here.

  category = Category.find_or_create_by(name: item['Category'])

  #good for checking for problems in the seed. But also nice to see when seeeding is done
  puts "Creating item: #{item['Title']}"
  puts "Description: #{item['Description']}"

  item = Item.find_or_create_by!(title: item['Title'], description: item['Description'], artist: item['Artist'], price: item['Price'] , quantity: item['Quantity'], category: category)

  # LEAVING THIS BECAUSE IT MIGHT BE USEFUL LATER
  # order_item = OrderItem.find_or_create_by!(title: item['Title'], price_at_purchase: item['Price'], date_price_good_until: Time.current)

  # Where "category_name" is the category name as a string. You will need to get this from the data returned from the csv library.
end

