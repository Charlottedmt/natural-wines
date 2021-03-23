class LocationsController < ApplicationController

  def index
    @locations = Location.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @markers = @locations.geocoded.map do |location|
    #   {
    #     lat: location.latitude,
    #     lng: location.longitude
    #     infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
    #   }
    # end
  end
end
