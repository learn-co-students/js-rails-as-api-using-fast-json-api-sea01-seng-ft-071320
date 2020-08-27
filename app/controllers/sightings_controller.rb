class SightingsController < ApplicationController
  def index
    sightings = Sighting.includes(:bird, :location).all
    render json: SightingSerializer.new(sightings)
  end

  def show
    sighting = Sighting.includes(:bird, :location).find(params[:id])
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
  end
end
