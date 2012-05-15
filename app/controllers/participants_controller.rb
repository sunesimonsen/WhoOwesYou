class ParticipantsController < ApplicationController
  def show
    @arrangement = Arrangement.find(params[:arrangement_id])
    @participant = @arrangement.participants.find(params[:id])
  end

  def create
    arrangement = Arrangement.find(params[:arrangement_id])
    arrangement.participants.build(:name => params[:name]).save;
    redirect_to arrangement_path(arrangement)
  end

  def destroy
    arrangement = Arrangement.find(params[:arrangement_id])
    participant = arrangement.participants.find(params[:id])
    participant.destroy
    redirect_to arrangement_path(arrangement)
  end 
end
