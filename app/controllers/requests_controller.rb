class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @request = Request.new

    @request.instructor_id = params[:instructor_id]
    @request.phone = params[:phone]
    @request.message = params[:message]
    @request.name = params[:name]
    @request.email = params[:email]

    @request.save
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :instructor_id)
  end
end
