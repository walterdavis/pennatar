json.array!(@portraits) do |portrait|
  json.extract! portrait, :id, :img, :person_id
  json.url portrait_url(portrait, format: :json)
end
