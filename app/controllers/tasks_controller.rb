class TasksController < ApplicationController

  before_filter :authenticate_user!

  def index
    @task = Task.new
    @tasks_completed_today = current_user.tasks.completed_today.all
    @tasks_overdue = current_user.tasks.overdue.all
    @tasks_due_today = current_user.tasks.due_today.all
    @tasks_no_due_date = current_user.tasks.no_due_date.all
    @tasks_due_beyond_today = current_user.tasks.due_beyond_today.all
    @pending_tasks_count = @tasks_overdue.count + @tasks_due_today.count + @tasks_no_due_date.count + @tasks_due_beyond_today.count
    @pending_tasks = [ [ @tasks_overdue, 'overdue' ],[ @tasks_due_today, 'due_today' ],[ @tasks_no_due_date, 'no_due_date' ],[ @tasks_due_beyond_today, 'due_beyond_today'] ] 
  end

  def new
    @task = Task.new
    tag_count = Tag.count
    tag_count.times { @task.tags.build }
    user_count = User.count
    user_count.times { @task.users.build }
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    if params[:commit] == '+ with options'
      @adding_with_options = true
      render :new
    else
      if @task.save
        redirect_to user_path(current_user), :notice => 'Added.'
      else
        render :new
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      if !@task.complete.blank? && !@task.schedule_id.blank? && @task.schedule_id != 1
        schedule_next(@task)
        redirect_to user_path(current_user), :notice => 'Completed.'
      else
        redirect_to user_path(current_user), :notice => 'Updated.'
      end
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to user_path(current_user), :notice => 'Deleted.'
  end
  
  private
  
  def schedule_next(task)
    next_task = Task.new(task.attributes)
    next_task.complete = nil
    next_task.completed_by = nil
    task.tags.each do |tag|
      next_task.tags << tag
    end
    task.users.each do |user|
      next_task.users << user
    end
    if task.schedule.name == 'Every day'
      next_task.due = task.due + 1.day
    elsif task.schedule.name == 'Every weekday'
      next_task.due = task.due + 1.day
      until (1..5).include?(next_task.due.wday) do
        next_task.due = next_task.due + 1.day
      end 
    elsif task.schedule.name == 'Every week'
      next_task.due = task.due + 1.week
    elsif task.schedule.name == 'Every 2 weeks'
      next_task.due = task.due + 2.weeks
    elsif task.schedule.name == 'Every month'
      next_task.due = task.due + 1.month
    elsif task.schedule.name == 'Every quarter'
      next_task.due = task.due + 3.months
    elsif task.schedule.name == 'Every year'
      next_task.due = task.due + 1.year
    else
    end
    next_task.save
  end
end
