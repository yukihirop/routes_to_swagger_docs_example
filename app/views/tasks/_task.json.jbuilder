json.extract! task, :id, :status, :content, :created_at, :updated_at
json.url task_url(task, format: :json)
