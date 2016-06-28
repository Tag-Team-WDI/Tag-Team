class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user_params=params.require(:user).permit(:email, :password, :first_name, :last_name, :location)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/sign_in"
    end
  end

  def delete
   logout
   redirect_to users_path
  end

end
