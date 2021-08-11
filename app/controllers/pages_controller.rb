class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @locations = Location.all
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
          # infoWindow: render_to_string(partial: "info_window", locals: { location: location })
        }
      end
    end
    @current_position =
      {
        image_url: helpers.asset_url('user_position.png')
      }
  end

end
