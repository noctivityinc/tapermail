json.array!(@downloads) do |download|
  json.extract! download, :email, :name, :token, :last_download_at, :number_remaining
  json.url download_url(download, format: :json)
end
