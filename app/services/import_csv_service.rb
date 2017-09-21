require 'csv'
class ImportCSVService
  attr_reader :file

  def initialize(file)
    @file = file
  end

  # Parse the CSV file and save records in the database.
  # Here we expect that user will select only CSV file.
  def import
    csv = CSV.parse(file, headers: true)
    ActiveRecord::Base.transaction do
      csv.each do |product|
        begin
          category = Category.find_or_create_by(title: product[1])
          product_obj = Product.find_or_create_by(pid: product[0])
          product_obj.update(name: product[2], price: product[3].to_i, category_id: category.id)
        rescue => e
          Rails.logger.error "Error: Error in creating following products - #{product.inspect} - #{e.message} - #{e.backtrace.join("\n")}"
        end
      end
    end
  end
end