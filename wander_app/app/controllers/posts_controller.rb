class PostsController < ApplicationController
  include PostsHelper

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
   @post = Post.new(post_params)
   @post.save
     redirect_to posts_path
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
      # flash.notice = "Post/Food Log Deleted" - maybe include. Distracting?
      redirect_to posts_path
  end











end # end of class
