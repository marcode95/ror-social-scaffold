module PostHelper
  def display_errors(post)
    return unless post.errors.full_messages.any?

    content_tag :p, "Post could not be saved. #{post.errors.full_messages.join('. ')}", class: 'errors'
  end

  def find_friendship(friendship, user_id, friend_id, confirmed)
    friendship.find_by(user_id: user_id, friend_id: friend_id, confirmed: true)
  end

  def show_timeline
    if find_friendship(@friendship, current_user, post.user, true) or current_user == post.user
      render @timeline_posts
    end
  end
end
