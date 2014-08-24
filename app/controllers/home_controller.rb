class HomeController < ApplicationController

  def index
    if user_signed_in? and !current_user.last_checkin.blank?
      @x = current_user.checkins.last.place.longitude
      @y = current_user.checkins.last.place.latitude
      @friends_near = Array.new
      @places = Place.near([@y, @x], 200, :units => :km)
      @friends = current_user.friends
      @friends.each do |f|
        @places.each do |p|
        if f.checkins.last.place.id = p.id
          @friends_near.push(f)
        end
      end
    end
  end
  end
end