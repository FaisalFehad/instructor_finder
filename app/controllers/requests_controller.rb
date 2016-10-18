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

    if InstructorsMailer.confirm_request(@request).deliver && InstructorsMailer.admin_confirm_request(@request, @admins = Admin.all).deliver && @request.save
      redirect_to :root
      flash[:notice] = "Your request has been sent to your instructor. Someone
      will be in touch with you soon."
    else
      redirect_to :root
      flash[:alert] = "Faild to submit the request. Please make sure the
      details you enterd are valid and try again."
    end
  end

  def history
    @request = Request.order(created_at: :desc)
  end
end
