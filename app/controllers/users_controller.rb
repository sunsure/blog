class UsersController < ApplicationController
  load_and_authorize_resource except: [:create]
  authorize_resource only: [:create]

  def index
    @users = @users.page(params[:page]).per(params[:per_page])
  end

  def show
  end

  def new
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

  def safe_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, role_ids: [])
  end

end
