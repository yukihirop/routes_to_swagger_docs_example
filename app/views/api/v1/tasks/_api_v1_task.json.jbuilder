json.extract! api_v1_task, :id, :status, :content, :created_at, :updated_at
json.url api_v1_task_url(api_v1_task, format: :json)
