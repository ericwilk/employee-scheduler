require 'thread'

class FifoSupportAssignmentStrategy
  @semaphore = Mutex.new
  @current_day = Date.today
  @support_array = [];

  def self.add_support_hero_day(user)
    #@semaphore.synchronize do
      sd = ScheduledDate.new(:user => user, :day => @current_day, :event_type_name => "SUPPORT_HERO")
      sd.save!
      user.update_attribute(:number_days_assigned, user.number_days_assigned ? user.number_days_assigned + 1 : 0)
      @current_day += 1
      @support_array << user unless @support_array.include?(user)
    #end
  end
  
  all_users = User.find(:all)
  all_users.each{|usr| add_support_hero_day(usr)}
    
  @support_array.sort_by!{|usr| usr.number_days_assigned}
  
  def generate_support_days_until(end_date)
    start = @current_day
    start..end_date do
      add_support_hero_day(@support_array[0])
      # This could probably be improved time-wise
      @support_array.sort_by!{|usr| usr.number_days_assigned}
    end
  end

end


  
