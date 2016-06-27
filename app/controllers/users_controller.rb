class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end


  def new
    @user = User.new
    render :new
  end


  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to "/users/#{@user.id}"
  end


  def show
    @user = User.find(params[:id])
    render :show
  end


  def edit
    @user = User.find(params[:id])
    render :edit
  end


  def update
    @user = User.find(params[:id])
    if current_user == @user
      @user.update_attributes(user_params)
      if @user.save
        flash[:notice] = "Profile Updated!"
        redirect_to "/users/#{@user.id}"
      else
        flash[:error] = @user.errors.full_messages.join("---")
        redirect_to "/users/#{@user.id}/edit"
      end
    else
      flash[:notice] = "Bad Hacker!"
      redirect_to "/"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :password)
  end

end
