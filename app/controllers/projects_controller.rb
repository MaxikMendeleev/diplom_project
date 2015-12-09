class ProjectsController < ApplicationController
  include ApplicationHelper

  @paginate = 10

  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :update, :create, :destroy]


  def index
    @projects = Project.order('name ASC').paginate( page: params[:page], :per_page => @paginate)
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Проект обновлен"
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
      create_project_users
      flash[:success] = "Проект успешно создан"
      redirect_to @project
    else
      render 'new'
    end
  end

  def destroy
    Project.find(params[:project_id]).destroy
    flash[:success] = "Проект удален"
    redirect_to projects_url
  end

  private

  def project_params
    params.require(:project).permit(:name,
                                    :wiki,
                                    :user_ids=>[params[:to]])
  end

  def create_project_users
    #params[:user]
  end
end
