class LocationsController < ApplicationController

  def index
    @locations = Location.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @locations.geocoded.map do |location|
     if location.category == "Shop"
        {
          lat: location.latitude,
          lng: location.longitude,
          image_url: helpers.asset_url('store.png'),
          infoWindow: render_to_string(partial: "info_window", locals: { location: location })
        }
      else
        {
          lat: location.latitude,
          lng: location.longitude,
          image_url: helpers.asset_url('restaurant.png'),
          infoWindow: render_to_string(partial: "info_window", locals: { location: location })
        }
      end
    end

    @current_position =
      {
        image_url: helpers.asset_url('user_position.png')
      }
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit(:address, :name, :category)
  end
end
