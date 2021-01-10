class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        # ConfirmMailer.confirm_mail(@post.user).deliver
        redirect_to posts_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end

  def show
    if logged_in?
      @favorite = current_user.favorites.find_by(post_id: @post.id)
    else
      redirect_to new_user_path, notice: "ログインが必要です"
    end
  end

  def edit
    unless @post.user == current_user
      redirect_to posts_path
    end
  end

  def update
    if @post.user != current_user
      redirect_to new_post_path
    else
      if @post.update(post_params)
        redirect_to post_path(@post.id), notice: "編集しました"
      else
        render :edit
      end
    end
  end

  def destroy
    if @post.user != current_user
      redirect_to posts_path
    else
      @post.destroy
      redirect_to posts_path, notice: "削除しました"
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
