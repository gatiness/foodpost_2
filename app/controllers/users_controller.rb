class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_user!, except: [:index]
  # def new
  # end

  def show
    @user = User.find(params[:id])
  end

  # def index
  # end

  # def edit
  # end

  # private
  #   def user_params
  #     params.require(:user).permit(:name, :email, :password, :image, :password_confirmation)
  #   end
end
