class TasksController < ApplicationController

  def index
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to(:root, :notice => 'Added shit.')
    else
      render :index
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to(:root, :notice => 'Updated shit.')
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to(tasks_url)
  end
end
