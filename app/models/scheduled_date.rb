class ScheduledDate < ActiveRecord::Base
  accepts_nested_attributes_for :resource
  belongs_to :resource, :polymorphic => true, :dependent => :destroy
  validates_presence_of :day
  
  def event_attributes=(params = {})
    sr = self.resource = spec_type.constantize.new unless self.resource
    sr.attributes = params.select{|k| sr.attribute_names.include?(k) || sr.class::ACCESSOR.include?(k.to_sym)}
  end
end
