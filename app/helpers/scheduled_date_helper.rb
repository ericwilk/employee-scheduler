module ScheduledDateHelper
  attr_accessor :support_hero_assignment_strategy
  
  def build_resource(klass)
    klass  = "{klass.capitalize}"
    object = eval("#{klass}.new")
    if @scheduled_date.resource.class.name == klass
      object = @scheduled_date.resource
    end
    return object
  end

  def initialize(support_hero_assignment_strategy)
    @support_hero_assignment_strategy = support_hero_assignment_strategy
  end

  def set_support_hero_days(end_date)
    @support_hero_assignment_strategy.generate_support_days_until(end_date)
  end

  def day_is_assignable(day, user)
    !day.saturday? && !day.subday && !BlackoutDate.find(:day => day, :engineer => user)
  end    
end
