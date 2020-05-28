module PostsHelper

  def current_user_post?(a_post)
    current_user.id == a_post.user_id
  end
end
