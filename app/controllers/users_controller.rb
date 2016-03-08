class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :edit, :update, :destroy ]

  def show
    @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  def edit
    @user
  end

  def update
    @user.update!(user_params)
  redirect_to user_path(@user)
  end

  def destroy
    @user.destroy!
  redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :encrypted_password, :photo, :photo_cache)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
