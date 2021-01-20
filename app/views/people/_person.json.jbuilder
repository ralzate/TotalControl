json.extract! person, :id, :name, :lastname, :phone, :mail, :address, :identification, :company, :user_id, :created_at, :updated_at
json.url person_url(person, format: :json)
