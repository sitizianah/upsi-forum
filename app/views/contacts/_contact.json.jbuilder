json.extract! contact, :id, :message, :user_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
