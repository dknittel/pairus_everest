module HoursHelper

  def thedate(hourObj)
    y = Time.now.year
    m = hourObj.month
    d = hourObj.day
    h = hourObj.hr
    Time.new(y, m, d, h)
  end

  def in_past?(hourObj)
    Time.now > thedate(hourObj)
  end

  def sorted_hours
    current_user.hours.order(month: :asc, day: :asc, hr: :asc)
  end
end
