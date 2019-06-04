class CoursesController < ApplicationController
 def index

  @courses = Course.all

  if params[:city].present?
    @courses = Course.near(params[:city])
  end

  if params[:language].present?
    @courses = @courses.joins(:language).where("languages.name ILIKE :language", language: params[:language] )
  end

end

def show
  @course = Course.find(params[:id])
  @booking = Booking.new
  @user = @course.user
  @reviews_teacher_for_course = @course.user.teacher_reviews_for_show


  @markers =
      [{
        lat: @course.latitude,
        lng: @course.longitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { course: @course })
      }]
end

def new
  @course = Course.new
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

    params.require(:course).permit(:title,
      :language_id,
      :video_url,
      :description,
      :end_date,
      :start_date,
      :level,
      :address,
      :area,
      :city,
      :picture,
      :picture_cache,
      :capacity,
      :price,
      :start_time,
      :end_time)
  end
end
