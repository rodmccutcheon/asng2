class Admin::TeamsController < ApplicationController
  def index
    @teams = Team.all
    @team = Team.new
  end

  def create
    @teams = Team.all
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        flash[:notice] = 'Team was successfully created.'
        format.html  { redirect_to :action => "index" }
      else
        format.html  { render :action => "index" }
      end
    end
  end
end