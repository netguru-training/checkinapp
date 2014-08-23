class Place < ActiveRecord::Base
  has_many :checkins
end
