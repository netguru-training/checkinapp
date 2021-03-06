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
  validate :sender_cannot_be_receiver
  validates :sender_id, :uniqueness => { :scope => :receiver_id }
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  enum status: {pending: 0, accepted: 1, rejected: 2}

  scope :pending, -> { where(status: '0') }
  scope :accepted, -> { where(status: '1') }
  scope :rejected, -> { where(status: '2') }
  scope :senders, -> (user_id) { where(sender_id: user_id) }
  scope :receivers, -> (user_id) { where(receiver_id: user_id) }
  scope :finder, -> (user1_id, user2_id) { where('(sender_id=? AND receiver_id=?) OR (sender_id=? AND receiver_id=?)', user1_id, user2_id, user2_id, user1_id ) }

  def sender_cannot_be_receiver
    if sender_id==receiver_id
      errors.add(:foreveralone, "You can't invite yourself.")
    end
  end
end
