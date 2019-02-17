class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
    end
  end

  def post
    if logged_in?
      @micropost  = current_user.microposts.build
      @comment = Comment.new
      @comments = @micropost.comments
     else
      redirect_to login_url
    end
  end

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @comment = Comment.new
      @comments = @micropost.comments
    else
      redirect_to login_url
    end
  end
end