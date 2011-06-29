# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Create users

bing = User.create(:email => 'virtuallybing@gmail.com', :password => 'chou5614', :password_confirmation => 'chou5614', :username => 'bing')
erin = User.create(:email => 'erin.workchou@gmail.com', :password => 'carsonsmom', :password_confirmation => 'carsonsmom', :username => 'erin')
carson = User.create(:email => 'carson@chou.com', :password => 'carsonmichellechou', :password_confirmation => 'carsonmichellechou', :username => 'carson')

# Create schedules

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

# Create tags

personal = Tag.create(:name => 'personal')
work = Tag.create(:name => 'work')

# Create tasks
# Create tags_tasks
tweet_e_tutor = Task.create(:due => Time.now.change(:hour => 9), :title => 'Tweet for e-Tutor', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => User.find_by_username('bing'))
tweet_e_tutor.tags << Tag.find_by_name('work')
walk_zoe = Task.create(:due => Time.now.change(:hour => 17), :title => 'Walk Zoe', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => User.find_by_username('bing'))
walk_zoe.tags << Tag.find_by_name('personal')
feed_animals = Task.create(:due => Time.now.change(:hour => 9), :title => 'Feed Zoe and fish', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => User.find_by_username('bing'))
feed_animals.tags << Tag.find_by_name('personal')
rosetta_stone = Task.create(:due => Time.now.change(:hour => 17), :title => '15+ minutes of Rosetta Stone', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => User.find_by_username('bing'))
rosetta_stone.tags << Tag.find_by_name('personal')
water_lawn = Task.create(:due => Time.now.change(:hour => 9), :title => 'Water lawn and garden', :schedule_id => Schedule.find_by_name('Every day').id, :user_id => User.find_by_username('bing'))
water_lawn.tags << Tag.find_by_name('personal')
do_laundry = Task.create(:due => @monday.change(:hour => 17), :title => 'Do laundry', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => User.find_by_username('bing'))
do_laundry.tags << Tag.find_by_name('personal')
water_plants = Task.create(:due => @tuesday.change(:hour => 17), :title => 'Water indoor plants', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => User.find_by_username('bing'))
water_plants.tags << Tag.find_by_name('personal')
buy_groceries = Task.create(:due => @wednesday.change(:hour => 17), :title => 'Buy groceries', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => User.find_by_username('bing'))
buy_groceries.tags << Tag.find_by_name('personal')
mow_lawn = Task.create(:due => @sunday.change(:hour => 17), :title => 'Mow lawn', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => User.find_by_username('bing'))
mow_lawn.tags << Tag.find_by_name('personal')
review_finances_and_schedule = Task.create(:due => @sunday.change(:hour => 17), :title => 'Review finances and schedule with Erin', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => User.find_by_username('bing'))
review_finances_and_schedule.tags << Tag.find_by_name('personal')
erins_task = Task.create(:due => @sunday.change(:hour => 17), :title => 'Get a massage', :schedule_id => Schedule.find_by_name('Every month').id, :user_id => User.find_by_username('erin'))
erins_task.tags << Tag.find_by_name('personal')
update_adwords = Task.create(:due => Time.now.change(:hour => 9), :title => 'Update Adwords report', :schedule_id => Schedule.find_by_name('Every weekday').id, :user_id => User.find_by_username('bing'))
update_adwords.tags << Tag.find_by_name('work')
e_mail_marty = Task.create(:due => Time.now.change(:hour => 9, :minutes => 30), :title => 'E-mail Marty', :schedule_id => Schedule.find_by_name('Every weekday').id, :user_id => User.find_by_username('bing'))
e_mail_marty.tags << Tag.find_by_name('work')
meeting_follow_up = Task.create(:due => @wednesday.change(:hour => 15), :title => 'Create tasks from meeting with Marty', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => User.find_by_username('bing'))
meeting_follow_up << Tag.find_by_name('work')
update_milk_order = Task.create(:due => @wednesday.change(:hour => 17), :title => 'Update milk order', :schedule_id => Schedule.find_by_name('Every week').id, :user_id => User.find_by_username('bing'))
update_milk_order.tags << Tag.find_by_name('personal')
eat_breakfast = Task.create(:due => Time.now.change(:hour => 9), :title => 'Eat breakfast', :schedule_id => Schedule.find_by_name('Every weekday').id, :user_id => User.find_by_username('bing'))
update_milk_order.tags << Tag.find_by_name('personal')
eat_breakfast = Task.create(:due => Time.now.change(:hour => 12, minutes => 30), :title => 'Eat lunch', :schedule_id => Schedule.find_by_name('Every weekday').id, :user_id => User.find_by_username('bing'))
eat_breakfast.tags << Tag.find_by_name('personal')
have_snack_and_water = Task.create(:due => Time.now.change(:hour => 15, :minutes => 30), :title => 'Have a snack and a glass of water', :schedule_id => Schedule.find_by_name('Every weekday').id, :user_id => User.find_by_username('bing'))
have_snack_and_water.tags << Tag.find_by_name('personal')