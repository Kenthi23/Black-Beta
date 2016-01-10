json.array!(@posts) do |post|
  json.extract! post, :id, :body, :reply_id, :image, :movie
  json.url post_url(post, format: :json)
end
