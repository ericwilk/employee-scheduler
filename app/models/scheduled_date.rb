class ScheduledDate < ActiveRecord::Base
  validates_presence_of :day, :event_type_name
  belongs_to :user
  
  def event_type
    this.getAttribute(:event_type_name)
  end
end
