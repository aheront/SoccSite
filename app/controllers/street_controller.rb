class StreetController < ApplicationController
  def new
    @street = Street.new
    @countries = Country.all
    @cities = []
    if params[:country].present?
      @cities = Country.find(params[:country]).cities
    end
    if request.xhr?
      respond_to do |format|
        format.json {
          render json: {cities: @cities}
        }
      end
    end
  end

  def show
    @city = City.find_by("id = ?", params[:street][:city_id])
  end

  def create
    @street = Street.new(street_params)
    @street.city_id = params[:city]
    @street.save
    current_user.street = @street
    current_user.house = params[:street][:user][:house]
    current_user.apartment = params[:street][:user][:apartment]

    current_user.save
    redirect_to user_path(current_user)
  end


  private
  def street_params
    params.require(:street).permit(:name,user_attributes:[:house,:apartment])
  end
end
