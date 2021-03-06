json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :name, :email, :phone, :about
  json.url faculty_url(faculty, format: :json)
end
