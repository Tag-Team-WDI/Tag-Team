class UsersController < ApplicationController

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


  def show
    @user = User.find(params[:id])
    # Define user
    @user = current_user
    # Get art
    art_image = art_params[:image]
    original_filename = "no idea.png"
    # Create tempfile
    @file = PullTempfile.pull_tempfile(url: art_image, original_filename: original_filename)
    # Create empty array for our art description
    @description_array = [];
    # Hit the vision API via the google cloud vision wrapper
    @art_tags = GoogleCloudVision::Classifier.new("AIzaSyDZrCdlDY9Nj1abJZIYIjKWyYIwNj1o-Jg",
    [{ image: @file, detection: 'LABEL_DETECTION', max_results: 10 }]).response["responses"][0]["labelAnnotations"].each do |tag|
      @description_array.push(tag["description"])
    end
    # Create new art
    @art = Art.new({image: art_params[:image], user_id: @user.id, vision: @description_array})

    if @art.save
      @description_array.each do |value|
        @tag = Tag.new({art_id: @art.id, description: value })
        @tag.save
      end
    end
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
      flash[:notice] = "Profile Updated!"
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to "/"
  end
end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :password, :password_confirmation)
  end

end
