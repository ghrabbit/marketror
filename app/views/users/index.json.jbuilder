json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :firstname, :lastname, :email, :phone, :address, :salt, :newpassword, :_roles
  json.url user_url(user, format: :json)
end
