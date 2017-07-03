class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_check, only: [:update, :destroy]
  def new
    @user = User.new
  end

  def index
    @users = User.all
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

  def edit
  end

  def show
    @pins = User.find(params[:id]).pins
    # unless current_user.admin
      # redirect_to root_path
    # end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
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
