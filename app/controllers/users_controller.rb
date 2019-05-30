class UsersController < ApplicationController
  def edit
    @tags_by_category = InterestCategory.includes(:interest_tags).all.map { |c| [c, c.interest_tags] }.to_h
  end

  def update
    create_user_interests
    current_user.update(user_params)
    redirect_to edit_user_path(current_user)
  end

  def show
    @user = User.find(params[:id])

    @interests = @user.user_interests
    @tags = []
    @interests.each do |interest|
      @tags << interest.interest_tag
    end

    @categories = []
    @tags.each do |tag|
      @categories << tag.interest_category
    end

    @categories = @categories.uniq

    if current_user.student?
      @bookings = current_user.bookings
    else
      @courses = current_user.courses
      @bookings = bookings_teacher(@courses)
    end
    # @category = current_user.interest_tags.map { |it| it.interest_category }.uniq
  end

  private

  def bookings_teacher(courses)
    @courses.each { |course| course.bookings }
  end

  def create_user_interests
    # current_user.user_interests.reject { |ui| ui.interest_tag_id.in? user_params[:interest_tag_ids }.destroy
    interest_tag_ids = user_params[:interest_tag_ids].reject { |it| it == "" }

    interest_tag_ids.each do |interest_tag_id|
      UserInterest.create(user_id: current_user.id, interest_tag_id: interest_tag_id)
    end
  end

  def user_params
    params.require(:user).permit(
      :email,
      :name,
      :biography,
      :native_language,
      :photo,
      :nationality,
      interest_tag_ids: []
    )
  end
end
