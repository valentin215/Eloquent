class UsersController < ApplicationController
  def edit
    @tags_by_category = InterestCategory.includes(:interest_tags).all.map { |c| [c, c.interest_tags] }.to_h
    @interests = current_user.user_interests
  end

  def update
    create_user_interests
    current_user.update!(user_params)
    redirect_to user_path(current_user)
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
    @tags = @tags.uniq

    if @user.student?
      @bookings = @user.bookings
    else
      @courses = @user.courses
      @bookings = @user.teacher_bookings.includes(:course)
    end

    if @user.teacher?
      @reviews_teacher = @user.teacher_reviews_for_show
    end
    @tags_by_category = InterestCategory.includes(:interest_tags).all.map { |c| [c, c.interest_tags] }.to_h

    # @category = current_user.interest_tags.map { |it| it.interest_category }.uniq
  end

  private

  def create_user_interests
    # current_user.user_interests.reject { |ui| ui.interest_tag_id.in? user_params[:interest_tag_ids }.destroy
    interest_tag_ids = user_params[:interest_tag_ids].try(:reject) { |it| it == "" }

    interest_tag_ids.try(:each) do |interest_tag_id|
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
      :content,
      :rating,
      :teacher_experience,
      interest_tag_ids: []
    )
  end
end
