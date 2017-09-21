require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:camera_category) { FactoryGirl.create(:camera_category) }
  let!(:product_1) { FactoryGirl.create(:product_1, category: camera_category) }
  let!(:product_2) { FactoryGirl.create(:product_2, category: camera_category) }
  let!(:product_3) { FactoryGirl.create(:product_3) }

  describe '#index' do
    render_views

    it 'display categorised products listing in alphabetical order' do
      get :index, category_id: product_1.category.id
      expect(assigns(:products).count).to eq(2)
      assigns(:products).map(&:name) == [product_2.name,product_1.name]
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do
    it "display product details" do
      get :show, category_id: camera_category.id, id: product_1.id
      expect(assigns(:product).name).to eq('Sony NEX6')
      expect(response).to have_http_status(:success)
    end
  end
end
