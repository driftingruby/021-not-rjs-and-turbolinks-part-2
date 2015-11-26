class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
    # @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    # redirect_to @user, notice: 'User was successfully created.'
  end

  def update
    @user.update(user_params)
    # redirect_to @user, notice: 'User was successfully updated.'
  end

  def destroy
    @user_id = @user.id
    @user.destroy
    # redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_address)
    end
end
