class ScheduleController < ApplicationController
  before_filter :authenticate, :only => :modify
  def index
    ScheduledDateHelper.set_strategy(::FifoSupportAssignmentStrategy)
    @support_hero_today = ScheduledDateHelper.get_support_hero_today
    @all_users = User.find(:all)
  end

  def modify
  end
end
