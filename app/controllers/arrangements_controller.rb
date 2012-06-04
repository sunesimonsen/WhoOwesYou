class ArrangementsController < ApplicationController
  layout :resolve_layout

  def show
    @arrangement = Arrangement.find params[:id]
    @done = @arrangement.done?
    @participants = @arrangement.participants
    @participant = Participant.new

    if @done
      @transfers = @arrangement.settle_debt
      render "done"
    else
      render "show"
    end 
  end

  def create
    arrangement = Arrangement.create :name => params[:name]
    flash[:success] = "Arrangement was succesfully created."
    redirect_to arrangement_path(arrangement)
  end

  def update
    arrangement = Arrangement.find params[:id]
    unless arrangement.update_attributes(params[:arrangement])
      errors = participant.errors
      flash[:error] = errors.empty? ? "Error" : errors.full_messages.to_sentence
    end
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
