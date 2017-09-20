class ImportsController < ApplicationController
  def start
  end

  def import_csv
    ImportCSVService.new(params[:file]).import
    redirect_to start_path, notice: "Import Complete"
  end
end
