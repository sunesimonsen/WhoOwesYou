class ArrangementsController < ApplicationController
  layout :resolve_layout

  def show
    @arrangement = Arrangement.find params[:id]
    @participants = @arrangement.participants
    @participant = Participant.new
  end

  def create
    arrangement = Arrangement.create :name => params[:name]
    flash[:success] = "Arrangement was succesfully created."
    redirect_to arrangement_path(arrangement)
  end

  private

  def resolve_layout
    case action_name
    when "index"
      "arrangement_create"
    else
      "application"
    end
  end
end
