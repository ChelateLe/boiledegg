class CLikesController < ApplicationController
  before_action :set_post

  def create
    @like = Like.create(user_id: current_user.id, collabo_id: @collabo.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, collabo_id: @collabo.id)
    @like.destroy
  end

  private
  def set_post
    @collabo = Collabo.find(params[:collabo_id])
  end
end
