class SpecializationController < ApplicationController

  before_action :set_specialization, only: [:show, :edit, :update, :destroy]

  # GET /specializations
  def index
    @specializations = Specialization.all
  end

  # GET /specializations/1
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_specialization
    @specialization = Specialization.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def specialization_params
    params.require(:specialization).permit(:name)
  end

end
