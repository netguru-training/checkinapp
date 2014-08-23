# == Schema Information
#
# Table name: friendships
#
#  id          :integer          not null, primary key
#  status      :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#  sender_id   :integer
#  receiver_id :integer
#

class Friendship < ActiveRecord::Base

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  enum status: {pending: 0, accepted: 1, rejected: 2}

  scope :pending, -> { where(status: '0') }
  scope :accepted, -> { where(status: '1') }
  scope :rejected, -> { where(status: '2') }
  scope :friends, -> (user_id) { where('sender_id=? OR receiver_id=?', user_id, user_id) }

end
