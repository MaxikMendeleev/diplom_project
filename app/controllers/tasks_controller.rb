class TasksController < ApplicationController
  include ApplicationHelper

  before_action :admin_user,     only: [:index, :destroy]

  def index
    @task = Task.order('name ASC').paginate( page: params[:page], :per_page => 6)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_project.tasks.build(micropost_params)
    # @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Задача успешно создана!"
      redirect_to @task
    else
      render 'new'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Задача удалена"
    redirect_to tasks_url
  end

end
