class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @friendship_request = Friendship.find_by(friend_id: @user.id, confirmed: nil)
    @friendship_requester = User.find_by(id: @friendship_request.user_id)
  end
end
