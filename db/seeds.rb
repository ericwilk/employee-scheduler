# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['BLACKOUT', 'HOLIDAY', 'SUPPORT_HERO'].each do |evt|
  EventType.create!(:name => evt)
end

if (!User.find_by_email("Boris"))
  ['Sherry', 'Boris', 'Vicente', 'Matte', 'Jack', 'Zoe', 'Kevin',
   'Jay', 'Eadon', 'Franky', 'Luis', 'James'].each do |usr|
    u = User.new(:email => "#{usr}", :crypted_password => "d41d8cd98f00b204e9800998ecf8427e", :persistence_token => SecureRandom.uuid)
    u.save( :validate => false )
  end
end

{ Date.new(2015,1,1) => "New Year's Day", Date.new(2015,1,19) => "Martin Luther King Jr. Day", Date.new(2015,2,16) => "Presidents' Day",
    Date.new(2015,3,31) => "Cesar Chavez Day", Date.new(2015,5,25) => "Memorial Day", Date.new(2015,7,4) => "Independence Day",
      Date.new(2015,9,7) => "Labor Day", Date.new(2015,11,11) => "Veterans Day", Date.new(2015,11,26) => "Thanksgiving Day",
        Date.new(2015,11,27) => "Day After Thanksgiving", Date.new(2015,12,25) => "Christmas Day" }.each{|date,name|
          ScheduledDate.create!(:day => date, :event_type_name => "HOLIDAY", :holiday_name => name)}


