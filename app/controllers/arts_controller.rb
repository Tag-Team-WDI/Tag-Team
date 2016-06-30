require 'picguard'

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
    @art_tags = Picguard.analyze(image_path: 'public/ducks.jpg')
    @art = Art.new({image: art_params[:image], user_id: @user.id, vision: @art_tags})
    if @art.save
      redirect_to "/"
    end
end


  def edit
    @art = Art.find(params[:id])
    render :edit
  end


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
