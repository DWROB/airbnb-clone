class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.where("location LIKE ?", "%#{params[:location]}")
  end

  def show
    @apartment = Apartment.find(params[:id])
  end
end
