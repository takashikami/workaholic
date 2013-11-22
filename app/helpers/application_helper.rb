module ApplicationHelper
  WDAYS = ["日", "月", "火", "水", "木", "金", "土"]
  def yo day
    WDAYS[day.wday]
  end
end
