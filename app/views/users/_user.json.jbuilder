json.extract! user, :id, :name, :cpf, :password, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
