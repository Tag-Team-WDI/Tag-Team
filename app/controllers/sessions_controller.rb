class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = "Invalid email/password combination"
      redirect_to "/sign_in"
    end
  end

  def delete
   # logout
   session.delete(:user_id)
   @current_user = nil
   redirect_to users_path
  end

end
