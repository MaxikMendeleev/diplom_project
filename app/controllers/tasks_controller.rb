class TasksController < ApplicationController
  include ApplicationHelper

  before_action :admin_user,     only: [:index, :destroy]

  def index
  end

  def show

  end

  def edit
  end

  def new
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Задача удалена"
    redirect_to tasks_url
  end

end
