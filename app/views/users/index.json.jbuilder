json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :profile, :univ_id, :grade, :username, :image
  json.url user_url(user, format: :json)
end
