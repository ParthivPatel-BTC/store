require 'csv'
class ImportCSVService
  attr_reader :file

  def initialize(file)
    @file = file
  end

  # Read CSV file and import records in the database. 
  # Here we expect that user will select only CSV file.
  def import
    csv_text = File.read(@file.path)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |product|
      category = Category.find_or_create_by(title: product[1])
      product_obj = Product.find_or_create_by(pid: product[0])
      product_obj.update(name: product[2], price: product[3].to_i, category_id: category.id)
    end
  end
end