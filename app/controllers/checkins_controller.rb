class CheckinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  expose(:place)
  expose(:checkins)
  expose(:checkin, attributes: :checkin_params)

  def index
  end

  def show
  end

  def new
  end

  def create
    if checkin.save
      flash[:success] = 'CheckIn successfully added'
      redirect_to places_path
    else
     render action: 'new'
    end
  end

  def update
  end

  private

  def checkin_params
    params.require(:checkin).permit(:user_id, :place_id)
  end
end
