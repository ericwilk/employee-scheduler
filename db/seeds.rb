# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#if (!User.find_by_email("Boris"))
  #['Sherry', 'Boris', 'Vicente', 'Matte', 'Jack', 'Zoe', 'Kevin',
   #'Jay', 'Eadon', 'Franky', 'Luis', 'James'].each do |usr|
    #User.create(:type => "Engineer", :email => "#{usr}")
  #end
#end

def find_or_build_resource( date )
  obj = ScheduledDateHelper.build_resource(:scheduled_date.class.name)
  obj.setAttribute(:day, date)
  unless ScheduledDate.find(:day, date)
    obj.save!
  end
  return obj
end

Holiday.new(:resource => ( find_or_build_resource( Date.new(2015,1,1) ) ), :scope => "Federal", :holiday_name => "New Year's Day")
Holiday.new(:resource[:day] => Date.new(2015,1,19), :scope => "Federal", :holiday_name => "Martin Luther King Jr. Day")
Holiday.new(:resource[:day] => Date.new(2015,2,16), :scope => "Federal", :holiday_name => "Presidents' Day")
Holiday.new(:resource[:day] => Date.new(2015,3,31), :scope => "California", :holiday_name => "Cesar Chavez Day")
Holiday.new(:resource[:day] => Date.new(2015,5,25), :scope => "Federal", :holiday_name => "Memorial Day")
Holiday.new(:resource[:day] => Date.new(2015,7,4), :scope => "Federal", :holiday_name => "Independence Day")
Holiday.new(:resource[:day] => Date.new(2015,9,7), :scope => "Federal", :holiday_name => "Labor Day")
Holiday.new(:resource[:day] => Date.new(2015,11,11), :scope => "Federal", :holiday_name => "Veterans Day")
Holiday.new(:resource[:day] => Date.new(2015,11,26), :scope => "Federal", :holiday_name => "Thanksgiving Day")
Holiday.new(:resource[:day] => Date.new(2015,11,27), :scope => "Federal", :holiday_name => "Day After Thanksgiving")
Holiday.new(:resource[:day] => Date.new(2015,12,25), :scope => "Federal", :holiday_name => "Christmas Day")


