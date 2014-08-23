class FriendshipsController < ApplicationController

  expose(:friendships)
  expose(:friendship)
  expose(:friend) { User.find(params[:receiver_id]) }

  def create
    saved = current_user.ask_for_friendship(friend)
    if saved
      flash[:success] = 'Invite was successfully send.'
    else
      flash[:alert] = 'You cant invite.'
    end
    redirect_to :back
  end

end
