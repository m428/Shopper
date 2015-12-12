class PostsController < ApplicationController
  include PostsHelper

  before_filter :require_login, only: [:new, :create, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    #@posts = @user.posts - to make sure only a specific user's posts show up
  end

  def new
    @post = Post.new
  end

  def create
  @user = current_user
  #  @post = Post.new(params[user_id])
  @post = Post.new(post_params)
  @post.user_id = params[:user_id]
  @post.save
     redirect_to posts_path
    #  redirect_to user_path(@post.user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  @post = Post.find(params[:id])
  @post.update(post_params)
  redirect_to posts_path
end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
      # flash.notice = "Item Deleted" - maybe include. Distracting?
      redirect_to posts_path
  end

# Just added the private
private
  def post_params
    params.require(:post).permit(:title, :description)
  end

end # end of class
