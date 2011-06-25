class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?
  
  def show
    @user = User.find_by_username(params[:id])
    @task = Task.new
    @pending_tasks = [ [ @user.tasks.overdue, 'overdue' ],[ @user.tasks.due_today, 'due_today' ],[ @user.tasks.no_due_date, 'no_due_date' ],[ @user.tasks.due_beyond_today, 'due_beyond_today'] ]
  end
  
  private
  
  def correct_user?
    @user = User.find_by_username(params[:id])
    redirect_to user_path(current_user), :notice => "You don't have access to that account." unless current_user == @user
  end
end
