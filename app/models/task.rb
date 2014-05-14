class Task < ActiveRecord::Base

scope :incomplete, -> { where(completed: false) }

end
