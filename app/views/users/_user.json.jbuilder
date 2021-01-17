json.extract! user, :id, :name, :lastname, :phone, :mail, :address, :identification, :company, :created_at, :updated_at
json.url user_url(user, format: :json)
