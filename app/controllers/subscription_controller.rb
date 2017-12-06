class SubscriptionController < ApplicationController
  before_action :set_video, only: [:create,:destroy]
  def create
  	@subscription = Subscription.new
  	@subscription.channel = User.find(@video.uploader_id)
    @notification = Notification.create(recipient_id: @video.uploader_id , action: "followed" , user_id: current_user.id,notifiable_id: @video.uploader_id,notifiable_type: "User")
    @notification.save
    @subscription.subscriber = current_user
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @video, notice: 'Your Subscription Added' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	b = Subscription.where(subscriber: current_user,channel: @video.uploader)
    for i in b
   		i.destroy
    end
    respond_to do |format|
      format.html { redirect_to @video, notice: 'Subscription Removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def comment_params
    params.require(:subscription).permit(:subscriber_id,:channel_id)
  end
end
