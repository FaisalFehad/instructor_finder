class RequestsController < ApplicationController

  def index
    if params[:search].present?
      @instructors = Instructor.near(params[:search], 50)
    else
      # Shows all listed instructors by the created date.
      @instructors = Instructor.order('created_at DESC')
    end
  end
end
