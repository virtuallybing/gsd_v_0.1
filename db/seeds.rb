# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

task_due_yesterday = Task.create(:due => 1.day.ago, :title => 'Due yesterday', :description => 'This is a seed task due yesterday.')
task_due_today = Task.create(:due => 1.hour.from_now, :title => 'Due today', :description => 'This is a seed task due one hour from now.')
task_due_tomorrow = Task.create(:due => 1.day.from_now, :title => 'Due tomorrow', :description => 'This is a seed task due tomorrow.')
task_complete = Task.create(:due => 3.minutes.ago, :title => 'Completed today', :description => 'This is a seed task that was completed 5 minutes ago.', :complete => 5.minutes.ago)
task_no_due_date = Task.create(:title => 'No due date', :description => 'This is a seed task that has no due date.')