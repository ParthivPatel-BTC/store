require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "#index" do
    render_views
    let!(:category_1) { FactoryGirl.create(:camera_category) }
    let!(:category_2) { FactoryGirl.create(:white_goods_category) }
    let!(:category_3) { FactoryGirl.create(:audio_category) }

    it "render category listing in alphabetical order" do
      total_categories = Category.all.count
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to match total_categories.to_s
      Category.pluck(:title).sort == [category_3,category_1, category_2]
    end
  end
end
