class DislikeController < ApplicationController
	before_action :set_video, only: [:create]
	def create
		b = Dislike.new(video: @video,disliker: current_user)
		c = Like.where(video_id: @video.id,liker_id: current_user.id)
		if(c.blank?)
			respond_to do |format|
				if b.save
			        format.html { redirect_to @video, notice: 'You Disliked This Video.' }
			        format.json { render :show, status: :created, location: @video }
			    else
			        format.html { render :new }
			        format.json { render json: @video.errors, status: :unprocessable_entity }
			    end
			end
		else
			c.last.destroy
			respond_to do |format|	
				if b.save
			        format.html { redirect_to @video, notice: 'You Disliked This Video.' }
			        format.json { render :show, status: :created, location: @video }
			    else
			        format.html { render :new }
			        format.json { render json: @video.errors, status: :unprocessable_entity }
			    end
			end
		end
	end
	def set_video
    	@video = Video.find(params[:id])
  	end
end
