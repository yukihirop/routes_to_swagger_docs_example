json.extract! api_v2_post, :id, :status, :content, :created_at, :updated_at
json.url api_v2_post_url(api_v2_post, format: :json)
