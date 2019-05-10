json.extract! api_v1_post, :id, :status, :content, :created_at, :updated_at
json.url api_v1_post_url(api_v1_post, format: :json)
