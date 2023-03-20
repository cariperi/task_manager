class Task < ApplicationRecord
  def laundry?
    if title == 'laundry'
      return true
    elsif description == 'laundry'
      return true
    else
      return false
    end
  end
end