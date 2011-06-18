# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

task_due_yesterday = Task.create(:duration => 15, :due => 1.day.ago, :title => 'Due yesterday', :description => 'This is a seed task due yesterday.', :status => 0)
task_due_today = Task.create(:duration => 15, :due => 1.hour.from_now, :title => 'Due today', :description => 'This is a seed task due one hour from now.', :status => 0)
task_due_tomorrow = Task.create(:duration => 15, :due => 1.day.from_now, :title => 'Due tomorrow', :description => 'This is a seed task due tomorrow.', :status => 0)
task_complete = Task.create(:duration => 15, :due => 3.minutes.ago, :title => 'Recently completed', :description => 'This is a seed task that was completed 5 minutes ago.', :status => 1, :complete => 5.minutes.ago)