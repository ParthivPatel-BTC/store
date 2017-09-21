require 'rails_helper'

RSpec.describe ImportsController, type: :controller do

  describe "#start" do
    render_views
    it "returns http success" do
      get :start
      expect(response).to have_http_status(:success)
    end
  end

  describe "#import_csv" do
    render_views

    context "without selecting a file" do
      subject { post :import_csv, :file => "" }
      it 'redirects to start page' do
        post :import_csv
        assert_redirected_to start_path
        expect(Product.all.count).to eq(0)
      end
    end

    context "with selecting a file" do
      let(:params) do
        ActionController::Parameters.new(
          file: ActionDispatch::Http::UploadedFile.new(
            tempfile: File.new(Rails.public_path.join('test.csv')),
            filename: 'test.csv',
            type: 'text/csv'
          )
        )
      end

      it 'creates new products' do
        expect(Product.all.count).to eq(0)
        post :import_csv, params
        expect(Product.count).to eq(17)
        assert_redirected_to start_path
        assert_equal "Import Complete", flash[:notice]
      end
    end
  end
end
