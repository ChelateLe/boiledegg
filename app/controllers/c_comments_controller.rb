class CCommentsController < ApplicationController
  def create 
    comment = CComment.create(comment_params)
    if comment
      redirect_to "/collabos/#{comment.collabo.id}"
    else
      render "/collabos/#{comment.collabo.id}"
    end
  end

  private

  def comment_params
    params.require(:c_comment).permit(:text).merge(user_id: current_user.id, collabo_id: params[:collabo_id])
  end
end
