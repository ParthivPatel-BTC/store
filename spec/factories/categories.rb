FactoryGirl.define do
  factory :camera_category, class: 'category' do
    title 'Cameras'
  end

  factory :white_goods_category, class: 'category' do
    title 'WhiteGoods'
  end

  factory :audio_category, class: 'category' do
    title 'Audio'
  end
end