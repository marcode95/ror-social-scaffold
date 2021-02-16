class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id]) # rubocop: disable Layout/LineLength

    redirect_to users_path, notice: 'Friendship successfully created.' if @friendship.save
  end

  def update
    accepted_request = Friendship.find_by(user_id: friendship_params[:user_id], friend_id: current_user.id, confirmed: nil)
    accepted_request.confirmed = true
    if accepted_request.save
      Friendship.create(user_id: current_user.id, friend_id: friendship_params[:user_id], confirmed: true)
      redirect_to users_path
    else
      redirect_to users_path, alert: 'Something went wrong with the invite!'
    end
  end

  def destroy
    denied_request = Friendship.find_by(user_id: friendship_params[:user_id], friend_id: current_user.id, confirmed: nil)
    denied_request.destroy

    redirect_to users_path
  end

  private

  def friendship_params
    params.permit(:user_id)
  end
end
