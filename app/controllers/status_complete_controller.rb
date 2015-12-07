class StatusCompleteController < ApplicationController

  before_action :set_status_complete, only: [:show, :edit, :update, :destroy]

  # GET /StatusComplete
  def index
    @statusCompletes = StatusComplete.all
  end

  # GET /StatusComplete/1
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_status_complete
    @statusComplete = StatusComplete.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def status_complete_params
    params.require(:status_complete).permit(:name)
  end

end
