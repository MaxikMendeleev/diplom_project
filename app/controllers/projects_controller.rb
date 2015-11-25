class ProjectsController < ApplicationController
  include ApplicationHelper

  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :create, :destroy]


  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Проект успешно создан!"
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


  def project_params
    params.require(:project).permit(:name, :wiki)
  end

end
