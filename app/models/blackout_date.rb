class BlackoutDate < ActiveRecord::Base
  has_one :scheduled_date, :as => :resource
  has_many :engineers
end
