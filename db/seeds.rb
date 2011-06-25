# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


bing = User.create(:email => 'virtuallybing@gmail.com', :password => 'chou5614', :password_confirmation => 'chou5614', :username => 'bing')
erin = User.create(:email => 'erin.workchou@gmail.com', :password => 'carsonsmom', :password_confirmation => 'carsonsmom', :username => 'erin')
carson = User.create(:email => 'carson@chou.com', :password => 'carsonmichellechou', :password_confirmation => 'carsonmichellechou', :username => 'carson')
never = Schedule.create(:name => 'Never')
every_day = Schedule.create(:name => 'Every day')
every_weekday = Schedule.create(:name => 'Every weekday')
every_week = Schedule.create(:name => 'Every week')
every_week = Schedule.create(:name => 'Every 2 weeks')
every_month = Schedule.create(:name => 'Every month')
every_quarter = Schedule.create(:name => 'Every quarter')
every_year = Schedule.create(:name => 'Every year')
@monday = Time.now.beginning_of_week
@tuesday = Time.now.beginning_of_week + 1.day
@wednesday = Time.now.beginning_of_week + 2.days
@sunday = Time.now.beginning_of_week + 6.days
tweet_e_tutor = Task.create(:due => Time.now.change(:hour => 9), :title => 'Tweet for e-Tutor', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => 1)
walk_zoe = Task.create(:due => Time.now.change(:hour => 17), :title => 'Walk Zoe', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => 1)
feed_animals = Task.create(:due => Time.now.change(:hour => 9), :title => 'Feed Zoe and fish', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => 1)
rosetta_stone = Task.create(:due => Time.now.change(:hour => 17), :title => '15+ minutes of Rosetta Stone', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => 1)
water_lawn = Task.create(:due => Time.now.change(:hour => 9), :title => 'Water lawn and garden', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => 1)
do_laundry = Task.create(:due => @monday.change(:hour => 17), :title => 'Do laundry', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => 1)
water_plants = Task.create(:due => @tuesday.change(:hour => 17), :title => 'Water indoor plants', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => 1)
buy_groceries = Task.create(:due => @wednesday.change(:hour => 17), :title => 'Buy groceries', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => 1)
mow_lawn = Task.create(:due => @sunday.change(:hour => 17), :title => 'Mow lawn', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => 1)
review_finances_and_schedule = Task.create(:due => @sunday.change(:hour => 17), :title => 'Review finances and schedule with Erin', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => 1)
erins_task = Task.create(:due => @sunday.change(:hour => 17), :title => 'Get a massage', :schedule_id => Schedule.find_by_name('Every month').id, :user_id => 2)
