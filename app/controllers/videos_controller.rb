class VideosController < ApplicationController
  before_action :authenticate_user! , except: [:index,:show,:autocomplete,:search]
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /videos
  # GET /videos.json

  def index
    @notification = Notification.where(recipient: current_user)
    @videos = Video.where(published: true)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @subscriber = Subscription.new
    @notification = Notification.where(recipient: current_user)
    a = Subscription.where(channel: User.find(Video.find(params[:id]).uploader_id),subscriber: current_user )
    b = Like.where(liker: current_user,video_id: params[:id])
    c = Dislike.where(disliker: current_user,video_id: params[:id])
    if b.blank? && c.blank?
      @like = false
      @dislike = false
    elsif c.blank? 
      @dislike = false
      @like = true
    elsif b.blank? 
      @like = false
      @dislike = true
    end
    if a.blank?
      @subscribed = false
    else
      @subscribed = true
    end
    @comments = Video.find(params[:id]).comments.where(comments_id: nil)
    @comment = Comment.new
    @likes = Like.where(video_id: params[:id]).count
    @dislikes = Dislike.where(video_id: params[:id]).count
  end

  # GET /videos/new
  def new

    @notification = Notification.where(recipient: current_user)
    @tags = Tag.all
    @taghash = Hash.new
    for i in @tags
      @taghash["#{i.name}"] = nil;
    end
    @taghashj = @taghash.to_json
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit

    @notification = Notification.where(recipient: current_user)
    @id = params[:id]
    @video = Video.find(@id)
    @stag = @video.tags
    br = Array.new
    for i in @stag
      br.push("#{i.name}")
    end
    @savedTag = br
    @tags = Tag.all
    @taghash = Hash.new
    for i in @tags
      @taghash["#{i.name}"] = nil;
    end
    @taghashj = @taghash.to_json
    @tag_name = @video.tag_name
  end

  # POST /videos
  # POST /videos.json
  def create

    @notification = Notification.where(recipient: current_user)
    video_params["tag_name"][0]=""
    binding.pry
    ar = video_params["tag_name"].split(",")
    ar.delete("")
    for i in ar
      i.capitalize!
    end
    @video = Video.new(video_params)
    @video.uploader = current_user
    @video.count = 0
    for i in ar
      @s = Tag.find_by_name(i)
      if(@s.nil? == true)
        @newTag = Tag.new(:name => i ,:occurence => 1)
        @newTag.save
        @video.tags << @newTag
      else
        count = @s.occurence
        @s.occurence = count + 1
        @s.save
        @video.tags << @s
      end
    end
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update

    @notification = Notification.where(recipient: current_user)
    previous = @video.tag_name.split(",")
    current = video_params["tag_name"].split(",") - [""]
    deleted = previous - current
    newadded = current - previous
    for i in deleted
      b = Tag.find_by_name(i)
      @video.tags.delete(b)
      c = b.occurence
      b.occurence = c - 1
      b.save
    end
    for i in newadded
      i.capitalize!
    end
    for i in newadded
      @s = Tag.find_by_name(i)
        if(@s.nil? == true)
          @newTag = Tag.new(:name => i ,:occurence => 1)
          @newTag.save
          @video.tags << @newTag
        else
          if(@video.tags.include? @s)
            
          else
            count = @s.occurence
            @s.occurence = count + 1
            @s.save
            @video.tags << @s
          end
        end
    end
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy

    @notification = Notification.where(recipient: current_user)
    b = Comment.where(video_id: @video.id)
    for j in b
      for i in j.replies
        i.destroy
      end
      j.destroy
    end
    like = Like.where(video_id: @video.id)
    dislike = Dislike.where(video_id: @video.id)
    for j in like
      j.destroy
    end
    for k in dislike
      k.destroy
    end
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def liked
    @like = Like.where(liker: current_user)
    @liked = []
    for i in @like
        if @liked.blank?
          @liked = [Video.find_by_id(i.video_id)]
        else 
          @liked << Video.find_by_id(i.video_id)
        end
    end
  end

  def disliked
    @dislike = Dislike.where(disliker: current_user)
    @disliked = []
    for i in @dislike
        if @disliked.nil?
          @disliked = [Video.find_by_id(i.video_id)]
        else
          @disliked << Video.find_by_id(i.video_id)
        end
    end
  end

  def search
    if params[:search].blank?
      result = Video.search "*"
    else
      result = Video.search(params[:search],
        operator: "or",
        misspellings: {below: 5}
        )
    end
    @result = []
    for i in result
      if i.published == true
        @result << i
      end
    end
  end

  def autocomplete
    render json: Video.search(params[:search], {
      fields: ["title^10","uploader^10","description^5","tag_name^11"],
      match: :word_middle,
      limit: 10,
      load: false,
      misspellings: {below: 10}
    }).map(&:title)
  end
  
  def myvideo 
    @videos = Video.where(uploader: current_user)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :description, :uploader_id, :published,:movie,:tag_name,{preview_images: []}, tag_ids: [])
    end
end
