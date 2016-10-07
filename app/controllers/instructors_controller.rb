class InstructorsController < ApplicationController
  # Admin is required to login to access any action on this controller
  before_action :authenticate_admin!, except: [:index, :show] #unlocked action

  def index
    if params[:search].present?
      @instructors = Instructor.near(params[:search], 50)
    else
      # Shows all listed instructors by the created date.
      @instructors = Instructor.order('created_at DESC')
    end
  end

  def show
    find_instructor
  end

  def new
    @instructor = Instructor.new
  end

  def update
    find_instructor
    if @instructor.update(instructor_params)
      redirect_to @instructor
      flash[:notice] = "Instructor changes has been saved."
    else
      render 'edit'
    end
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      flash[:notice] = "Instructor has been saved!"
      redirect_to instructors_path
    else
      render 'new'
      flash_error('New instructor hasn\'t been saved.')
    end
  end

  def edit
    find_instructor
  end

  def destroy
    find_instructor
     if @instructor.destroy
       redirect_to root_path
       flash[:notice] = "The instructor has been deleted."
     else
       flash_error('Instructor hasn\'t been deleted.')
     end
  end

    private

    def flash_error(message) # Takes the of the error message as an argument
      flash[:alert] = "Something went wrong!, #{message}
                       Please make sure you submitting valid data and try again"
    end

    def find_instructor
      @instructor = Instructor.find(params[:id])
    end

    def instructor_params
       params.require(:instructor).permit(:name, :email, :car, :address, :manual, :auto)
    end
end
