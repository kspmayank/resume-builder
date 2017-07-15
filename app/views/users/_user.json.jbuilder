json.extract! user, :id, :email, :password_hash, :mobile, :verified, :created_at, :updated_at
json.url user_url(user, format: :json)
