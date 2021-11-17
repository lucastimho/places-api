class PlacesController < ApplicationController
  def index
    render json: Place.all
  end
  def show
    render json: Place.find_by(id: params[:id])
  end
  def create
    place = Place.new(
      name: params[:name],
      address: params[:address]
    )
    if place.save
      render json: place
    else 
      render json: {error: place.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def update
    place = Place.find_by(id: params[:id])
    place.name = params[:name] || place.name
    place.address = params[:address] || place.address
    if place.save
      render json: place
    else
      render json: {error: place.errors.full_messages}, status: 418
    end
  end
  def destroy
    Place.destroy_by(id: params[:id])
    render json: Place.all
  end
end
