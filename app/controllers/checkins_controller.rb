class CheckinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  expose(:place)
  expose(:checkins)
  expose(:checkin)

  def index
  end

  def show
  end

  def new
  end

  def create
  	self.checkin = Checkin.new(checkin_params)
  	if checkin.save
  	  current_user.checkins << checkin
  	  place.checkins << checkin
  	  flash[:success] = 'CheckIn successfully added'
  	  redirect_to places
  	else
     render action: 'new'
  	end
  end

  def update
  end

  private
    def checkin_params
      params.require(:checkin).permit(:timestamp, :user_id, :place_id)
end
