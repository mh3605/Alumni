json.array!(@researchareas) do |researcharea|
  json.extract! researcharea, :id, :name
  json.url researcharea_url(researcharea, format: :json)
end
