class TasksController < ApplicationController
  before_filter :check_signed_in_status
  before_filter :get_task, only: [:edit, :update, :destroy]

  def check_signed_in_status
    unless session[:user_id]
      redirect_to login_url, notice: 'Please Sign in'
    end
  end
  def get_task
    @task = Task.find(params[:id])
  end

  def index
    @tasks = current_user.tasks
    @task = Task.new
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.js { render 'new', layout: false }
    end
  end

  def edit
    respond_to do |format|
      format.js { render 'edit', layout: false }
    end
  end

  def create
    @task = Task.create(params[:task])
    respond_to do |format|
      format.js { render 'create', layout: false }
    end
  end

  def update
    @task.update_attributes(params[:task])
    respond_to do |format|
        format.js { render 'update', layout: false }
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js { render 'destroy', layout: false }
    end
  end
end
