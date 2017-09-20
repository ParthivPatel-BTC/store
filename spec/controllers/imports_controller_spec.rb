require 'rails_helper'

RSpec.describe ImportsController, type: :controller do

  describe "GET #start" do
    it "returns http success" do
      get :start
      expect(response).to have_http_status(:success)
    end
  end

end
