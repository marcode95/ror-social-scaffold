class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id]) # rubocop: disable Layout/LineLength

    redirect_to users_path, notice: 'Friendship successfully created.' if @friendship.save
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
