class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id]) # rubocop: disable Layout/LineLength

    redirect_to users_path, notice: 'Friendship successfully created.' if @friendship.save
  end

  def update
    accept = Friendship.find_by(user_id: friendship_params[:user_id], friend_id: current_user.id, confirmed: nil)
    accept.confirmed = true
    if accept.save
      Friendship.create(user_id: current_user.id, friend_id: friendship_params[:user_id], confirmed: true)
      redirect_to users_path
    else
      redirect_to users_path, alert: 'Something went wrong with the invite!'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    redirect_to users_path
  end

  private

  def friendship_params
    params.permit(:user_id)
  end
end
