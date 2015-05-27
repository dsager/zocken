json.array!(@participations) do |participation|
  json.extract! participation, :id, :player_id, :result_id, :bet_id
  json.url player_participation_url(@player, participation, format: :json)
end
