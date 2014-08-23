# == Schema Information
#
# Table name: checkins
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  place_id   :integer
#

class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
end
