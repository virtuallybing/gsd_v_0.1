# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

never = Schedule.create(:name => 'Never')
every_day = Schedule.create(:name => 'Every day')
every_week = Schedule.create(:name => 'Every week')
every_month = Schedule.create(:name => 'Every month')
every_quarter = Schedule.create(:name => 'Every quarter')
every_year = Schedule.create(:name => 'Every year')
@monday = Time.now.beginning_of_week
@tuesday = Time.now.beginning_of_week + 1.days
@wednesday = Time.now.beginning_of_week + 2.days
@sunday = Time.now.beginning_of_week + 6.days
walk_zoe = Task.create(:due => Time.now.change(:hour => 17), :title => 'Walk Zoe', :schedule_id => Schedule.find_by_name('Every day').id)
feed_animals = Task.create(:due => Time.now.change(:hour => 9), :title => 'Feed Zoe and fish', :schedule_id => Schedule.find_by_name('Every day').id)
rosetta_stone = Task.create(:due => Time.now.change(:hour => 17), :title => '15+ minutes of Rosetta Stone', :schedule_id => Schedule.find_by_name('Every day').id)
water_lawn = Task.create(:due => Time.now.change(:hour => 9), :title => 'Water lawn and garden', :schedule_id => Schedule.find_by_name('Every day').id)
do_laundry = Task.create(:due => @monday.change(:hour => 17), :title => 'Do laundry', :schedule_id => Schedule.find_by_name('Every week').id)
water_plants = Task.create(:due => @tuesday.change(:hour => 17), :title => 'Water indoor plants', :schedule_id => Schedule.find_by_name('Every week').id)
buy_groceries = Task.create(:due => @wednesday.change(:hour => 17), :title => 'Buy groceries', :schedule_id => Schedule.find_by_name('Every week').id)
mow_lawn = Task.create(:due => @sunday.change(:hour => 17), :title => 'Mow lawn', :schedule_id => Schedule.find_by_name('Every week').id)
review_finances_and_schedule = Task.create(:due => @sunday.change(:hour => 17), :title => 'Review finances and schedule with Erin', :schedule_id => Schedule.find_by_name('Every week').id)