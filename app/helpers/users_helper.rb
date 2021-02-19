module UsersHelper
  def invite_check
    render partial: 'invite' unless current_user == @user && !current_user.friend?(@user) && !current_user.request_sent?(@user) # rubocop:disable Layout/LineLength
  end

  def pending_check
    render partial: 'pending' if current_user == @user
  end

  def check_friendship(friendship, user_id, friend_id)
    friendship.find_by(user_id: user_id, friend_id: friend_id)
  end

  def check_if_friends_yet(blabla)
    if !find_friendship(@friendship, current_user.id,
                        blabla.id) and !find_friendship(@friendship, blabla.id,
                                                        current_user.id) and current_user != blabla
      render @users
    end
  end

  def check_pending_friendship(friendship, user_id, friend_id)
    friendship.find_by(user_id: user_id, friend_id: friend_id, confirmed: nil)
  end

  def pending_friendship_render(user)
    render partial: 'request' if check_pending_friendship(@friendship, user.id, current_user.id)
  end
end
