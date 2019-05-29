class CoursesController < ApplicationController
 def index
    @courses = Course.all
    if params[:city].present?
      @courses = @courses.where("address ILIKE ?", "%#{params[:city]}%")
    end
    if params[:language].present?
      @courses = @courses.where("language = ?", params[:language]) ## we may have to change the argument of language
    end

  end

  def show
    @course = Course.find(params[:id])
    @booking = Booking.new
    @user = @course.user
  end

  def new
    @courses = Course.new
  end

  def create

    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if current_user != @course.user
      redirect_to courses_path
      flash[:warning] = "Get out of here !"
    else
      @course.destroy
      redirect_to courses_path
      # might be nice to redirect somewhere more usefull.
    end
  end

  def edit
    @course = Course.find(params[:id])
    if current_user != @course.user
      redirect_to courses_path
      flash[:warning] = "Get out of here !"
    end
    # rails will render a templaye with the same name as the action
    # located in a folder with the same name as the controller
    # -> flats/edit.html.erb
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to course_path(@course)
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :end_date,:start_date, :level, :address, :area, :city, :latitude, :longitude )
  end
end
