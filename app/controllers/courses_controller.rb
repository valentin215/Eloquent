class CoursesController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :show]

 def index

  @courses = Course.all

  if params[:city].present? && params[:language].present?

    sql_query = "\
    languages.name ILIKE :language \
    AND courses.city ILIKE :city \
    "
    @courses = Course.joins(:language).where(sql_query, language: "%#{params[:language]}%", city: "%#{params[:city]}%")

  elsif params[:city].present?
    @courses = @courses.where("city ILIKE ?", "%#{params[:city]}%")

  elsif params[:language].present?
    sql_query = "\
    languages.name ILIKE :language \
    "
    @courses = Course.joins(:language).where(sql_query, language: "%#{params[:language]}%")
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
      :language,
      :video_url,
      :description,
      :end_date,
      :start_date,
      :level,
      :address,
      :area,
      :city,
      :picture,
      :picture_cache)
  end
end
