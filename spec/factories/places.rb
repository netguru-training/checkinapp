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

FactoryGirl.define do
  factory :place do
    name "MyString"
    street "MyText"
    city "MyString"
    country "MyString"
  end
end
