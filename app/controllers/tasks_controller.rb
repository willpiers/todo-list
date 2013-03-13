class TasksController < ApplicationController
  before_filter :check_signed_in_status

  def check_signed_in_status
    unless current_user
      redirect_to login_url, notice: 'Please Sign in'
    end
  end

  def index
    @tasks = current_user.tasks
    @task = Task.new

    respond_to do |format|
      format.html
      format.json { render json: @tasks }
    end
  end

  def new
    @task = Task.new

    respond_to do |format|
      format.js { render 'new', layout: false }
      format.html { redirect_to root_url, alert: 'This Page does not exist' }
    end
  end

  def edit
    @task = Task.find(params[:id])

    respond_to do |format|
      format.js { render 'edit', layout: false }
    end
  end

  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
        format.js { render 'create', layout: false }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
        format.js { render 'update', layout: false }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
      format.js { render 'destroy', layout: false }
    end
  end
end
