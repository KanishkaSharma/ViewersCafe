json.extract! video, :id, :tags_id, :title, :description, :uploder_id, :published, :comment_id, :created_at, :updated_at
json.url video_url(video, format: :json)
