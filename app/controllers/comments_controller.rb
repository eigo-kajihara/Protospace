class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], prototype_id: comment_params[:prototype_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to prototype_path(params[:prototype_id]) }
      format.json
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to prototype_path(params[:prototype_id]) }
      format.json {render json: @comment}
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.update(comment_params)
    end
  end

  private
  def comment_params
    params.permit(:text, :prototype_id)
  end
end
