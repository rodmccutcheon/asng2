class Admin::SeasonsController < ApplicationController
  def index
    @seasons = Season.all
    @season = Season.new
  end
  
  def create
    @seasons = Season.all
    @season = Season.new(params[:season])

    respond_to do |format|
      if @season.save
        flash[:notice] = 'Season was successfully created.'
        format.html  { redirect_to :action => "index" }
      else 
        format.html  { render :action => "index" }
      end
    end
  end

  def edit
    @season = Season.find(params[:id])
  end

  def update
    @season = Season.find(params[:id])

    respond_to do |format|
      if @season.update_attributes(params[:season])
        flash[:notice] = 'Season was successfully updated.'
        format.html  { redirect_to :action => "index" }
      else
        format.html  { render :action => "edit" }
      end
    end
  end

  def destroy
    @season = Season.find(params[:id])
    @season.destroy

    respond_to do |format|
      format.html { redirect_to admin_seasons_url }
    end
  end

end
