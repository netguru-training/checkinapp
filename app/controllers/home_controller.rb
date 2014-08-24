class HomeController < ApplicationController

  def index
    gon.markers = []
    @checkins = []

    if user_signed_in? and !current_user.last_checkin.blank?
      last_place = current_user.last_checkin.place
      km = params[:km] || 1
      places = Place.near([last_place.latitude, last_place.longitude], km, units: :km)

      friend_checkins = current_user.friends.map(&:last_checkin).compact
      checkins = friend_checkins.select { |c| places.include?(c.place) }
      gon.markers = checkins.map(&:place).map { |p| [p.latitude, p.longitude] }
      @checkins = CheckinDecorator.decorate_collection(checkins)
    end
  end
end
