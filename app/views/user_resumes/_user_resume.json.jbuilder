json.extract! user_resume, :id, :user_id, :template, :content, :created_at, :updated_at
json.url user_resume_url(user_resume, format: :json)
