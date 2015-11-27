class TasksController < ApplicationController
  include ApplicationHelper

  before_action :admin_user,     only: [:index, :destroy]

  def index
    @tasks = Task.order('name ASC').paginate( page: params[:page], :per_page => 6)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
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

  private

  def task_params
    params.require(:task).permit(:name,
                                 :complete,
                                 :info)
  end

end
