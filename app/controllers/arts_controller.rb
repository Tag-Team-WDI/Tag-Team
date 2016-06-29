class ArtsController < ApplicationController

def index
    @arts = Art.all
    render :index
  end


  def new
    @art = Art.new
    render :new
  end


  def create
    @art = Art.new(art_params)
      if @art.save
        # login(@art)
        redirect_to "/arts/#{@art.id}"
      else
        flash[:error] = @art.errors.full_messages.join(", ")
        redirect_to arts_path
      end
  end


  def show
    @art = Art.find(params[:id])
    render :show
  end


  def edit
    @art = Art.find(params[:id])
    render :edit
  end



  # def index
  #   @user = Art.all
  #   if params[:search]
  #     @arts = Art.search(params[:search]).order("created_at DESC")
  #   else
  #     @arts = Art.all.order('created_at DESC')
  #   end
  # end


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
    params.require(:art).permit(:user_id)
  end


end
