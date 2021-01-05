class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def authenticate_user
    if logged_in?
      unless current_user.id == @posts.user_id
        flash[:notice] = "権限がありません"
        redirect_to posts_path
      end
    else
      redirect_to new_user_path, notice: "ログインが必要です"
    end
  end

  def ensure_current_user
    if logged_in?
      unless current_user.id == params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to posts_path
      end
    else
      redirect_to new_user_path, notice:"ログインが必要です"
    end
  end
end
