class SupportHeroDate < ActiveRecord::Base
  has_one :scheduled_date, :as => :resource
  has_one :user
end
