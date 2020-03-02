class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @courses = SearchCourses.new(params: params[:query]).call
      @language = params[:query][:language]
      @city = params[:query][:city]
    else
      @courses = Course.all
    end
    geocoder_map(@courses)
  end

def show
  @course = Course.find(params[:id])
  @booking = Booking.new
  @user = @course.user
  @reviews_teacher_for_course = @course.user.teacher_reviews_for_show
  geocoder_map(@course)
end

def new
  @course = Course.new
end

def create
  @course = Course.new(course_params)
  @course.user = current_user
  if @course.save
    create_course_days
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

  def geocoder_map(course)
    if course.size != 1
      courses = course
      @markers = courses.map do |course|
        {
          lat: course.latitude,
          lng: course.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { course: course })
        }
      end

      @markers = courses.map do |course|
        {
          lat: course.latitude,
          lng: course.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { course: course })
        }
      end
    elsif course = 1
      @markers =
      [{
        lat: @course.latitude,
        lng: @course.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { course: course })
      }]
    end
  end 

  def create_course_days
    params[:course][:course_day_ids].each do |day|
      CourseDay.create(
        course_id: @course.id,
        start_time: params[:course][:start_time],
        end_time: params[:course][:end_time],
        working_day: day
      )
    end
  end

  def course_params

    params.require(:course).permit(
      :title,
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
    )
  end
end
