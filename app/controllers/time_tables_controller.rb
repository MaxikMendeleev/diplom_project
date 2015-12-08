class TimeTablesController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @time_table = @task.time_tables.build
  end

  def show

  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @time_table = @task.time_tables.build
  end

  def create
    @task = Task.find(params[:task_id])
    @time_table = @task.time_tables.build(time_table_params)
    @time_table.user_id = current_user.id
    if @time_table.save
      flash[:success] = "Трудозатраты успешно сохранены!"
      redirect_to project_task_path(id:params[:task_id], project_id:params[:project_id])
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  private

  def time_table_params
    params.require(:time_table).permit(:count
                                )
  end

end
