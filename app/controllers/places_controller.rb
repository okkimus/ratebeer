class PlacesController < ApplicationController
  def index
  end

  def show
    places = BeermappingApi.places_in(session[:city])

    @place = places.select {|pleis| pleis.id == params[:id] }
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      session[:city] = params[:city]

      render :index
    end
  end
end