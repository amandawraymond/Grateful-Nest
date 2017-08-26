json.items do
  json.array! @lists do |list|
    json.(list, :id, :created_at, :updated_at)
    json.items list.items
  end
end