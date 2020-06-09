json.array! @follows do |follow|
  json.extract! follow, :id, :game_title, :box_art, :viewers, :stream_title, :streamer_name, :thumbnail, :avatar, :online_status
end
