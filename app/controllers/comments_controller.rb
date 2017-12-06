class CommentsController < ApplicationController
  before_action :set_video, only: [:create]
  def create
  	@comment = @video.comments.new(comment_params)
    @comment.commentor = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @video, notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body,:comments_id)
  end
end
