require 'open-uri'
class ImportsController < ApplicationController
  def start
  end

  # To import data from remote or local
  def import_csv
    if params[:file].present?
      csv_content = File.read(params[:file].path)
    elsif params[:via_remote].present?
      csv_content = open('https://f.dynamiccreative.com/devtest/test.csv')
    else
      redirect_to start_path, error: "Please select CSV file"
      return
    end

    ImportCSVService.new(csv_content).import
    redirect_to start_path, notice: "Import Complete"
  end
end
