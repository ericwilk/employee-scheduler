module ScheduledDateHelper

  def self.set_strategy(clazz)
    @support_hero_assignment_strategy = clazz
  end

  def self.set_support_hero_days(end_date)
    @support_hero_assignment_strategy.generate_support_days_until(end_date)
  end

  def self.day_is_assignable(day, user)
    !day.saturday? && !day.subday && !ScheduledDate.find(":day = day.strftime('%Y-%m-%d') and event_type_name == 'BLACKOUT' and :user_id = user.id")
  end
  
  def self.get_support_hero_today
    sd = ScheduledDate.find(:first, :conditions => "event_type_name = 'SUPPORT_HERO' and day = '#{Date.today.strftime('%Y-%m-%d')}'")
    sd.user
  end
end
