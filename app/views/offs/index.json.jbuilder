json.array!(@offs) do |off|
  json.extract! off, :id, :user_id, :off_date, :subject, :off_days, :off_type, :off_half_type, :off_quarter_time
  json.url off_url(off, format: :json)
end
