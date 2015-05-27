json.array!(@results) do |result|
  json.extract! result, :id, :title, :description, :is_correct, :bet_id
  json.url bet_result_url(@bet, result, format: :json)
end
