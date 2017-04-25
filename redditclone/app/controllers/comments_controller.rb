class CommentsController < ApplicationController
  before_action :not_logged_in?

  def new
    @post_id = params[:post_id]
    render :new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content, :parent_comment_id)
  end
end
