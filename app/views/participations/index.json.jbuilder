json.array!(@participations) do |participation|
  json.extract! participation, :id, :player_id, :result_id, :bet_id
  json.url participation_url(participation, format: :json)
end
