class UserController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by id: params[:id]
    @user.update_attributes user_params
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit :name,:address, posts_attributes: [:id,
      :user_id, :title, :content]
    end
end
