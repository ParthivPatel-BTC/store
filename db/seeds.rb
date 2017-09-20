# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts '------------START: Seeding products------------'

products = 
  [
    ['C1', 'Cameras','Sony NEX6', 1199], 
    ['C2', 'Cameras','Canon 7D',  2999], 
    ['C3',  'Cameras','Canon EOS 1100D,', 418],
    ['W1',  'WhiteGoods', 'LG Fridge',  670],
    ['W2',  'WhiteGoods', 'Breville Toaster', 99],
    ['A1',  'Audio',' Sony Speakers', 499],
    ['A2',  'Audio',' Sennheiser Headphones', 299],
    ['A3',  'Audio',' Bose QC15 Headphones', 329],
    ['CT1', 'Computers and Tablets','Apple iPad Air', 599],
    ['CT2', 'Computers and Tablets','Apple Macbook Pro',  1899],
    ['CT3', 'Computers and Tablets','Toshiba Laptop',  1399],
    ['CT4', 'Computers and Tablets','Apple iPad Mini',  499],
    ['CT5', 'Computers and Tablets','Apple Mac Pro',  2999],
    ['CT6', 'Computers and Tablets','Samsung Galaxy Tab', 699],
    ['CT7', 'Computers and Tablets','Asus Sub-notebook',  498],
    ['CT8', 'Computers and Tablets','Brother Laser Printer',  399],
    ['CT9', 'Computers and Tablets','Seagate External HDD 1TB', 129]
  ]

products.each do |product|
  category = Category.find_or_create_by(title: product[1])
  product_obj = Product.find_or_create_by(pid: product[0])
  puts "name: #{product[2]}"
  product_obj.update(name: product[2], price: product[3].to_i, category_id: category.id)
  puts "category with name: #{product[2]} and product with id #{product[0]} created"
end

puts '------------END: Seeding products------------'