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
    @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Hello, #{@user.first_name}! Welcome to Vagabond!"
        login(@user)
        redirect_to "/users/#{@user.id}"
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
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
    @user.update_attributes(user_params)
    if @user.save
       redirect_to "/users/#{@user.id}"
    else
      redirect_to "/"
  end
end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :password, :image)
  end

end
