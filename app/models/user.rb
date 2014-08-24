# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :checkins

  def friends
    User.find((Friendship.senders(self.id).pluck(:receiver_id)+Friendship.receivers(self.id).pluck(:sender_id)).uniq)
  end

  def full_name
    [first_name, last_name].join(' ').titleize
  end

  def ask_for_friendship(friend)
    Friendship.create(sender_id: self.id, receiver_id: friend.id)
  end

  def last_checkin
    if checkins.present?
      @last_checkin ||= checkins.last.place.name + " " + checkins.last.place.street
    end
  end

end
