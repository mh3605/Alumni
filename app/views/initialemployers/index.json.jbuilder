json.array!(@initialemployers) do |initialemployer|
  json.extract! initialemployer, :id, :name
  json.url initialemployer_url(initialemployer, format: :json)
end
