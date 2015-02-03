class Holiday < ActiveRecord::Base
    has_one :scheduled_date, :as => :resource
    has_one :scope
    has_one :name
end
