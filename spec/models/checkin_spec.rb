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

require 'rails_helper'

RSpec.describe Checkin, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
