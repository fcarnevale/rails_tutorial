class UsersController < ApplicationController
  before_action :signed_in_user,        only: [:index, :edit, :update, :destroy]
  before_action :correct_user,          only: [:edit, :update]
  before_action :admin_user,            only: :destroy
  before_action :signed_in_restriction, only: [:new, :create]
  before_action :self_preservation,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user, flash: { success: "Profile updated" }
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url, flash: { success: "User deleted." }
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url, notice: "You are not authorized to do that, sucka." unless current_user?(@user)
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end

    def signed_in_restriction
      redirect_to root_url, notice: "No no no, you don't need to go there." if signed_in?
    end

    def self_preservation
      @user = User.find(params[:id])
      redirect_to root_url, notice: "That's a little self destructive now, isn't it?" if current_user?(@user)
    end
end
