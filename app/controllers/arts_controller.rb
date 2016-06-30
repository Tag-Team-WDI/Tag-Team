require 'pull_tempfile'
require 'json'


class ArtsController < ApplicationController



def index
    @arts = Art.all
    render :index
  end

  def show
    @art = Art.find(params[:id])
    render :show
  end

  def new
    @art = Art.new
    render :new
  end



  def create
    @user = current_user

    art_image = art_params[:image]
    original_filename = "no idea.png"

    @file = PullTempfile.pull_tempfile(url: art_image, original_filename: original_filename)

    @art_tags = GoogleCloudVision::Classifier.new("AIzaSyDZrCdlDY9Nj1abJZIYIjKWyYIwNj1o-Jg",
    [{ image: @file, detection: 'LABEL_DETECTION', max_results: 10 }]).response["responses"][0]["labelAnnotations"][0]["description"]

    @art = Art.new({image: art_params[:image], user_id: @user.id, vision: @art_tags})

    if @art.save
      redirect_to "/"
    end

end


  def edit
    @art = Art.find(params[:id])
    render :edit
  end

#   # def index
#   #   @user = Art.all
#   #   if params[:search]
#   #     @arts = Art.search(params[:search]).order("created_at DESC")
#   #   else
#   #     @arts = Art.all.order('created_at DESC')
#   #   end
#   # end

  def update
    @art = Art.find(params[:id])
    @art.update_attributes(art_params)
    if @art.save
      flash[:notice] = "Art Updated!"
      redirect_to "/arts/#{@art.id}"
    else
      flash[:error] = @art.errors.full_messages.join(", ")
      redirect_to "/"
  end
end


  private

  def art_params
    params.require(:art).permit(:user_id, :image, :vision)
  end


end
