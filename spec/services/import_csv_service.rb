require 'rails_helper'

context ImportCSVService do
  context 'read_csv' do
    it 'should save csv data' do
      csv_content = File.read(Rails.public_path.join('test.csv'))
      ImportCSVService.new(csv_content).import
      expect(Product.count).to eq(17)
      expect(Category.count).to eq(4)
      expect(Category.find_by(title: 'Computers and Tablets').products.count).to eq(9)
    end
  end
end