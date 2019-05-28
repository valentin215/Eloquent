class UsersController < ApplicationController
  def edit
    @tags_by_category = InterestCategory.all.map { |c|  [c, c.interest_tags] }.to_h
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

  def show
  end

  def user_params
    params.require(:user).permit(:email, :name, :biography, :native_language, :photo, :nationality)
  end

end
