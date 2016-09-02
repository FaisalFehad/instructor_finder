class RequestsController < ApplicationController

  def index
    if params[:search].present?
      @instructors = Instructor.near(params[:search], 50)
    else
      # Shows all listed instructors by the created date.
      @instructors = Instructor.order('created_at DESC')
    end
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    #@request = Request.new(request_params)
    @request.save
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone, :message)
  end
end
