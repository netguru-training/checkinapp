class UsersController < ApplicationController
  before_action :authenticate_user!

  expose(:users)
  expose(:user)
  expose(:last_checkin) { user.checkins.last }

  def index
  end

  def show
    if last_checkin.present?
      gon.lat = last_checkin.place.latitude
      gon.lng = last_checkin.place.longitude
    else
      flash[:info] = "This user dont have any checkins yet."
    end
  end

end
