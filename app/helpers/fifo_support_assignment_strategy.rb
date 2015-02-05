require 'thread'

# This class keeps track of support days worked by a priority queue
# I did not think it would be a good idea to change <=>

class FifoSupportAssignmentStrategy
  @semaphore = Mutex.new
  @current_day = Date.today
  @support_heap = [];

  def self.add_support_hero_day(user, date=nil)
    hu = HeapedUser.new(user)
    date = @current_day if date.nil?
    return if date.saturday? || date.sunday?
    @semaphore.synchronize do
      if @support_heap.include?(hu)
        hu.number_days_assigned += 1
        @current_day += 1
        hu.usr.save!
      else
        sd = ScheduledDate.new(:user => user, :day => @current_day, :event_type_name => "SUPPORT_HERO")
        sd.save!
        hu.usr.update_attribute(:number_days_assigned, hu.number_days_assigned ? hu.number_days_assigned + 1 : 0)
        @current_day += 1
        @support_heap << hu
      end
    end
  end
  
  if !User.find(:first, :conditions => "email = 'Jay'" )
    all_users = User.find(:all)
    all_users.each{|usr| add_support_hero_day(HeapedUser.new(usr))}
  end
    
  ApplicationHelper.sort_for_heap @support_heap
  
  def self.generate_support_days_until(end_date)
    return if end_date < @current_day # before the dawn of time, all was nil
    start = @current_day
    start.step(end_date,1) do |dt|
      return if dt.saturday? || dt.sunday?
      add_support_hero_day(@support_heap[0])
    end
    ApplicationHelper.sort_for_heap @support_heap
  end

end

class HeapedUser < User
  include Comparable
  @usr = nil
  def initialize usr
    @usr = usr
  end

  def <
    c.number_days_assigned < other.number_days_assigned
  end

  def >
    c.number_days_assigned < other.number_days_assigned
  end

  def ==
    c.number_days_assigned == other.number_days_assigned
  end

  def usr
    @usr
  end
end
