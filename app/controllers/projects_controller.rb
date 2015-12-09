class ProjectsController < ApplicationController
  include ApplicationHelper

  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :update, :create, :destroy]


  def index
    @projects = Project.order('name ASC').paginate( page: params[:page], :per_page => 10)
  end

  def show
    @project = Project.find(params[:id])
    @all_project_time = 0
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Проект обновлен"
      #update_project_users
      redirect_to @project
    else
      render 'edit'
    end
  end

  def new
    @project = Project.new
    @users = User.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Проект успешно создан"
      create_project_users
      redirect_to @project
    else
      render 'new'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Проект удален"
    redirect_to projects_url
  end

  private

  def project_params
    params.require(:project).permit(:name,
                                    :wiki)
  end

  def update_project_users
    users = params[:to]
    delete_project_users(users)
    save_project_users(users)
    # удаление и сохранение
  end

  def create_project_users
    users = params[:to]
    save_project_users(users)
  end

  def save_project_users(users)
    users.each do |user_id|
      project_user = ProjectsUser.new
      project_user.user_id = user_id
      project_user.project_id = Project.where('name = ?', @project.name).first.id
      project_user.save
    end
  end

  def delete_project_users(users)
    users.each do |user_id|
      ProjectsUser.find(user_id).destroy
    end
  end

end
