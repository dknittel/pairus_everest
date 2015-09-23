module HoursHelper

  def thedate(hourObj)
    y = Time.now.year
    m = hourObj.month
    d = hourObj.day
    h = hourObj.hr
    Time.new(y, m, d, h)
  end
end
