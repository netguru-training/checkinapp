# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  street     :text
#  city       :string(255)
#  country    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  postcode   :string(255)
#

class Place < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  has_many :checkins

  def address
    "#{street}, #{city}"
  end
end
