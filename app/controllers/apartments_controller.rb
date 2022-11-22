class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[ show ]

  def index
    if params[:location].present?
      @apartments = Apartment.where("location LIKE ?", "%#{params[:location]}")
    else
      @apartments = policy_scope(Apartment)
    end
  end

  def show
    authorize(@apartment)
  end

  def new
    @apartment = Apartment.new
    authorize(@apartment)
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user

    authorize(@apartment)

    if apartment.save
      redirect_to @apartment, notice: "Apartment successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(:title, :location, :rating, :description, :imageURL)
  end

end
