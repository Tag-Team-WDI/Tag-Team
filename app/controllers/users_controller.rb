class UsersController < ApplicationController
  # To see the index page and must be signed in
  before_action :require_login, only: :index
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Hello, #{@user.first_name}! Welcome to Tag!"
      login(@user)
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
  
  #user must be signed in to see their index otherwise will show the main page
  def show
    if current_user
      @user = User.find(params[:id])
      @user = current_user
      render :show
    else
      flash[:error] = "Must be signed in to see your profile!!"
      redirect_to "/"
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      flash[:notice] = "Profile Updated!"
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :password, :password_confirmation, :image)
  end
end
