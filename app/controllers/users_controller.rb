class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.page(params[:page]).per(params[:per_page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(safe_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if safe_params[:password].blank?
      safe_params.delete("password")
      safe_params.delete("password_confirmation")

      if @user.update_without_password(safe_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    else
      if @user.update(safe_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully removed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def safe_params
    params.require(:user).permit(:email, :password, :password_confirmation, role_ids: [])
  end

end
