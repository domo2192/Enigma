require 'date'

module Randomable
  def convert_date
    Date.today.strftime('%m%d%y')
  end

  def key_numbers
    5.times.map do |_num|
      rand(9)
    end.join
  end
end
