module UsersHelper
  def invite_check
    if current_user != @user && !current_user.friend?(@user) && !current_user.request_sent?(@user)
      render partial: 'invite'
    end
  end

  def pending_check
    if current_user == @user
      render partial: 'pending'
    end 
  end

  def check_friendship(friendship, user_id, friend_id)
    friendship.find_by(user_id: user_id, friend_id: friend_id)
  end

  def check_if_friends_yet(blabla)
    if !find_friendship(@friendship, current_user.id, blabla.id) and !find_friendship(@friendship, blabla.id, current_user.id) and current_user != blabla
      render @users
    end
  end

  def check_pending_friendship(friendship, user_id, friend_id)
    friendship.find_by(user_id: user_id, friend_id: friend_id, confirmed: nil)
  end

  def pending_friendship_render(user)
    if check_pending_friendship(@friendship, user.id, current_user.id)
      render partial: 'request'
    end
  end
end
