class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    @prototype = Prototype.find(params[:id])
  end

  private
  def comment_params
    params.permit(:text, :prototype_id)
  end
end
