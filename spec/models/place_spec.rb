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

<<<<<<< HEAD
#  id         :integer          not null, primary key
#  name       :string(255)
#  street     :text
#  city       :string(255)
#  country    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  postcode   :string(255)
=======
#  id          :integer          not null, primary key
#  name        :string(255)
#  street      :text
#  city        :string(255)
#  country     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  postcode    :string(255)
#  coordinates :string(255)
>>>>>>> c0e59377b6647dd87ff424c6ebf01d2a57fdc13a
#

require 'rails_helper'

RSpec.describe Place, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
