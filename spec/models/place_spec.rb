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

require 'rails_helper'

RSpec.describe Place, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
