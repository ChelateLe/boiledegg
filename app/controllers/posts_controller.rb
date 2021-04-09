class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/users/#{current_user.id}"
    else
      render :new
    end
  end

  def index
    @posts = Post.all 
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end