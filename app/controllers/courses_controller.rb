class CoursesController < ApplicationController
 def index

  @courses = Course.all

  if params[:city].present?
    @courses = @courses.where("city ILIKE ?", "%#{params[:city]}%")
  end

  if params[:language].present?
    sql_query = "\
    languages.name ILIKE :language \
    "
    @courses = Course.joins(:language).where(sql_query, language: "%#{params[:language]}%")
  end

  if params[:city].present? && params[:language].present?

    sql_query = "\
    languages.name ILIKE :language \
    AND courses.city ILIKE :city \
    "
    @courses = Course.joins(:language).where(sql_query, language: "%#{params[:language]}%", city: "%#{params[:city]}%")
  end

end


              # # class MoviesController < ApplicationController
              # #   def index
              # #     if params[:query].present?
              #       sql_query = " \
              #         movies.title ILIKE :query \
              #         OR movies.syllabus ILIKE :query \
              #         OR directors.first_name ILIKE :query \
              #         OR directors.last_name ILIKE :query \
              #       "
              #       @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
              #     else
              #       @movies = Movie.all
              #     end
              #   end
              # end



              def show
                @course = Course.find(params[:id])
                @booking = Booking.new
                @user = @course.user
                @reviews_teacher_for_course = @course.user.teacher_reviews_for_show
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
    params.require(:course).permit(:title, :description, :end_date, :start_date, :level, :address, :area, :city, :latitude, :longitude )
  end
end
