class TasksController < ApplicationController

  def index
    @task = Task.new
    @tasks_completed_today = Task.completed_today.all
    @tasks_overdue = Task.overdue.all
    @tasks_due_today = Task.due_today.all
    @tasks_no_due_date = Task.no_due_date.all
    @tasks_due_beyond_today = Task.due_beyond_today.all
    @pending_tasks_count = @tasks_overdue.count + @tasks_due_today.count + @tasks_no_due_date.count + @tasks_due_beyond_today.count
    @pending_tasks = [ [ @tasks_overdue, 'overdue' ],[ @tasks_due_today, 'due_today' ],[ @tasks_no_due_date, 'no_due_date' ],[ @tasks_due_beyond_today, 'due_beyond_today'] ] 
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    if params[:commit] == 'Add with options'
      @adding_with_options = true
      render :new
    else
      if @task.save
        redirect_to :root, :notice => 'Added shit.'
      else
        render :new
      end
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      if !@task.complete.blank? && !@task.schedule.blank?
        schedule_next(@task)
      end
      redirect_to :root, :notice => 'Updated shit.'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to :root, :notice => 'Got rid of that shit.'
  end
  
  private
  
  def schedule_next(task)
    next_task = Task.new(task.attributes)
    next_task.complete = nil
    if task.schedule.name == 'Every day'
      next_task.due = task.due + 1.day
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
