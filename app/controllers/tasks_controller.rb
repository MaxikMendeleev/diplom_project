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
   # @status_complete = StatusComplete.find(@task.status_complete_id)
    @time_tables = TimeTable.select_task(params[:id])
    @time_table = 0
    !@time_tables ? false : @time_tables.each do |time|
      @time_table+=time.count.to_i
    end
  end

  def edit
    @status_complete = StatusComplete.all
    @users = User.get_project_users(params[:project_id])
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Задача обновлена"
      #update_task_users
      redirect_to project_task_path
    else
      render 'edit'
    end
  end

  def new
    @type_of_problem = TypeOfProblem.all
    @users = User.get_project_users(params[:project_id])
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:success] = "Задача успешно создана!"
      create_task_users
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
                                 :lead_time,
                                 :info,
                                 :type_of_problem_id,
                                 :status_complete_id
    )
  end

  def update_task_users
    users = params[:to]
    delete_task_users(users)
    save_task_users(users)
  end

  def create_task_users
    users = params[:to]
    save_task_users(users)
  end

  def save_task_users(users)
    users.each do |user_id|
      project_user = TasksUser.new
      project_user.user_id = user_id
      project_user.task_id = Task.where('name = ?', @task.name).first.id
      project_user.save
    end
  end

  def delete_task_users(users)
    users.each do |user_id|
      TasksUser.find(user_id).destroy
    end
  end

end
