module PostsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_posts_path
    else action_name == 'edit'
      post_path(@post.id)
    end
  end
end
