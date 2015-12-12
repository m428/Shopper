class PostsController < ApplicationController
  include PostsHelper

  before_filter :require_login, only: [:new, :create, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    #@posts = @user.posts - to make sure only a specific user's posts show up
  end

  def new
    @post = Post.new
  end

  def create
  @user = current_user # give access to all the things
  @post = Post.new(post_params)
  @post.user_id = @user.id # set user_id param from database relationship to current_user id
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
