class TypeOfProblemController < ApplicationController

  before_action :set_type_of_problem, only: [:show, :edit, :update, :destroy]

  # GET /TypeOfProblem
  def index
    @typeOfProblems = TypeOfProblem.all
  end

  # GET /TypeOfProblem/1
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_type_of_problem
    @typeOfProblem = TypeOfProblem.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def type_of_problem_params
    params.require(:type_of_problem).permit(:name)
  end

end
