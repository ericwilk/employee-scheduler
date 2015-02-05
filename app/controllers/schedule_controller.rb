class ScheduleController < ApplicationController
  before_filter :authenticate, :only => :modify

  ScheduledDateHelper.set_strategy(::FifoSupportAssignmentStrategy)

  def index
    @support_hero_today = ScheduledDateHelper.get_support_hero_today
    @all_users = User.find(:all)
  end

  def get_support_days_in_month
    # TODO: check if unset
    support_heros_for_month = []
    dte = Date.parse(params[:date])
    dte_formatted = dte.strftime('%Y-%m-%d')
    dte.step((dte - dte.mday + 1 >> 1) -1,1) do |dte|
      dte_formatted = dte.strftime('%Y-%m-%d')
      sd = ScheduledDate.find(:first, :conditions => [ "event_type_name = 'SUPPORT_HERO' and day = ?", dte_formatted])
      if sd.nil?
        #ScheduledDateHelper.set_support_hero_days(dte)
        next
      end
      hero = User.find(sd["user_id"])
      support_heros_for_month << [sd.day,hero.email]
      dte = dte + 1
    end
    render :json => support_heros_for_month.to_json
  end

  def modify
  end
end
