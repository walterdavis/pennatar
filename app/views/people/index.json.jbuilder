json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :pennid, :photo_key, :selected_portrait_id
  json.url person_url(person, format: :json)
end
