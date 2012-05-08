class ArrangementsController < ApplicationController
  def show
    @arrangement = Arrangement.find params[:id]
    @participants = @arrangement.participants
  end

  def create
    arrangement = Arrangement.create :name => params[:name]
    redirect_to arrangement_path(arrangement)
  end
end
