json.items do
  json.array! @lists do |list|
    json.(list, :id, :created_at, :updated_at)
    if list.has_items
      json.items list.items
    end
  end
end