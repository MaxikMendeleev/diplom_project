class ProjectsController < ApplicationController
  include ApplicationHelper
  before_action :admin_user,     only: [:destroy]
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Проект удален"
    redirect_to projects_url
  end
end
