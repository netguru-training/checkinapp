class CheckinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  expose(:place)
  expose(:checkins)
  expose(:checkin, attributes: :checkin_params)

  def index
    gon.lat = current_user.last_checkin.place.latitude
    gon.lng = current_user.last_checkin.place.longitude
  end

  def show
  end

  def new
  end

  def create
  	checkin.user = current_user
    if checkin.save
      flash[:success] = 'CheckIn successfully added'
    else
      flash[:error] = 'CheckIn error while adding'
    end
    redirect_to places_path
  end

  def update
  end

  private

  def checkin_params
    params.require(:checkin).permit(:place_id)
  end
end
