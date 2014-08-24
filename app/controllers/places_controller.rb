class PlacesController < ApplicationController

  expose(:places)
  expose(:place, attributes: :place_params)

  def index
  end

  def show
  end

  def new
  end

  def create
    if place.save
      flash[:success] = 'New place successfully added'
      redirect_to places_path
    else
      flash[:error] = 'New place successfully added'
      render action: 'new'
    end
  end

  def destroy
    place.destroy
    flash[:success] = 'Place successfully deleted'
  end

  def update
    if place.update(place_params)
      redirect_to places_path
    else
      render action: 'edit'
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :street, :city, :country, :postcode, :longitude, :latitude)
  end
end
