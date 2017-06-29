class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/pins'
    else
      redirect_to '/signup'
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def authorize_check
    if @user != current_user && !current_user.admin?
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
