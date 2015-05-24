json.array!(@results) do |result|
  json.extract! result, :id, :title, :description, :is_correct, :bet_id
  json.url result_url(result, format: :json)
end
