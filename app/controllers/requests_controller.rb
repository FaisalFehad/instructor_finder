class RequestsController < ApplicationController

  def index
    # Shows all listed instructors by the created date.
    @instructors = Instructor.order('created_at DESC')
  end
end
