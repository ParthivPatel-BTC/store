require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "#index" do
    render_views
    let!(:category_1) { FactoryGirl.create(:camera_category) }
    let!(:category_2) { FactoryGirl.create(:white_goods_category) }
    let!(:category_3) { FactoryGirl.create(:audio_category) }

    it "render category listing in alphabetical order" do
      get :index
      expect(assigns(:categories).pluck(:title)).to eq [category_3.title, category_1.title, category_2.title]
      expect(assigns(:categories).count).to eq 3
      expect(response).to have_http_status(:success)
    end
  end
end
