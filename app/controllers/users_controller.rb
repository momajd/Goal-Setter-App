class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @goal = Goal.new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
