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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :checkin do
    user_id 1
    place_id 1
    timestamp ""
  end
end
