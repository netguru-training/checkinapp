class PlacesController < ApplicationController

  expose(:places)
  expose(:place)

  def index
  end

  def show
  end

  def new
  end

  def create
  	self.place = Place.new(place_params)
  	if place.save
  	  flash[:success] = 'New place successfully added'
  	  redirect_to places
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
  	  redirect_to places
  	else
  	  render action: 'edit'
  	end
  end

  private
    def place_params
      params.require(:place).permit(:name, :street, :city, :country, :postcode, :longitude, :latitude)
    end
end
