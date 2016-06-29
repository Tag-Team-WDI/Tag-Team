class UsersController < ApplicationController

  def index
    @users = User.all
    # @art = GoogleCloudVision::Classifier.new(ENV["vision"],
    # [{ image: 'public/ducks.jpg', detection: 'LABEL_DETECTION', max_results: 10 }]).response
    render :index
  end

  def new
    @user = User.new
    render :new
  end


  def create
    @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Hello, #{@user.first_name}! Welcome to Tag!"
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



  # def index
  #   @user = Post.all
  #   if params[:search]
  #     @posts = Post.search(params[:search]).order("created_at DESC")
  #   else
  #     @posts = Post.all.order('created_at DESC')
  #   end
  # end


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
    params.require(:user).permit(:first_name, :last_name, :email, :location, :password, :image)
  end

end
