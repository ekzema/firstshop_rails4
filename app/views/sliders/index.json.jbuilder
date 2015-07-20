json.array!(@sliders) do |slider|
  json.extract! slider, :id, :name, :url_item
  json.url slider_url(slider, format: :json)
end
