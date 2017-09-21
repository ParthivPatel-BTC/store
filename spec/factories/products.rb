FactoryGirl.define do
  factory :product_1, class: 'product' do
    pid   'C1'
    name 'Sony NEX6'
    price 1199
  end

  factory :product_2, class: 'product' do
    pid   'C2'
    name 'Canon 7D'
    price 2999
  end

  factory :product_3, class: 'product' do
    pid   'w1'
    name 'LG Fridge'
    price 670
  end
end