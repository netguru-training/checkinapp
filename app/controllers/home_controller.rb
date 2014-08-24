class HomeController < ApplicationController

  def index
    if user_signed_in? and !current_user.last_checkin.blank?
      last_place = current_user.last_checkin.place
      places = Place.near([last_place.latitude, last_place.longitude], 1, units: :km)

      friend_checkins = current_user.friends.map(&:last_checkin).compact
      @checkins = friend_checkins.select { |c| places.include?(c.place) }.decorate
    end
  end
end