class PostsController < ApplicationController
  def new
  end

  def create 
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
