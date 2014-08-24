class AccountController < ApplicationController

  expose(:friends) { current_user.friends }
  expose(:pending_invitations) { Friendship.pending.where('sender_id=? OR receiver_id=?', current_user, current_user) }

  def show
  end
end

