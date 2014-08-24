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
#  longitude  :float            not null
#  latitude   :float            not null
#

class Place < ActiveRecord::Base
  has_many :checkins

  def address
    "#{street}, #{city}"
  end
end
