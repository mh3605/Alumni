json.array!(@alums) do |alum|
  json.extract! alum, :id, :name, :email, :phone, :about
  json.url alum_url(alum, format: :json)
end
