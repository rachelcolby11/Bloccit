class AdvertisementsController < ApplicationController

  def index
    @ads = Advertisement.all
  end

  def show
    @ads = Advertisement.find(params[:id])
  end

  def new
    @ads = Advertisement.new
  end

   def create
     @ad = Advertisement.new(params.require(:ad).permit(:title, :copy))
     if @ad.save
       flash[:notice] = "Ad was saved."
       redirect_to @ad
     else
       flash[:error] = "There was an error saving the ad. Please try again."
       render :new
     end
   end

  def edit
        @ad = Advertisement.find(params[:id])
  end

   def update
     @ad = Advertisement.find(params[:id])
     if @ad.update_attributes(params.require(:ad).permit(:title, :copy))
       flash[:notice] = "Ad was updated."
       redirect_to @ad
     else
       flash[:error] = "There was an error saving the ad. Please try again."
       render :edit
     end
   end

end
