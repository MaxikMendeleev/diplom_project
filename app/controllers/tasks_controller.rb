class TasksController < ApplicationController
  include ApplicationHelper

  before_action :admin_user,     only: [:index, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks.order('name ASC').paginate( page: params[:page], :per_page => 6)
  end

  def show
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Задача обновлена"
      redirect_to project_tasks_path
    else
      render 'edit'
    end
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
      redirect_to project_tasks_path
    else
      render 'new'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Задача удалена"
    redirect_to project_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name,
                                 :complete,
                                 :info)
  end

end
