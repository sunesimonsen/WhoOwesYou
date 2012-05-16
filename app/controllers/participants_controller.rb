class ParticipantsController < ApplicationController
  def show
    @arrangement = Arrangement.find(params[:arrangement_id])
    @participant = @arrangement.participants.find(params[:id])
    @expense = Expense.new
  end

  def create
    arrangement = Arrangement.find(params[:arrangement_id])
    participant = arrangement.participants.build(params[:participant]);
    if participant.save
      flash[:success] = "Participant was succesfully created."
    else 
      errors = participant.errors
      flash[:error] = errors.empty? ? "Error" : errors.full_messages.to_sentence
    end
    redirect_to arrangement_path(arrangement)
  end

  def destroy
    arrangement = Arrangement.find(params[:arrangement_id])
    participant = arrangement.participants.find(params[:id])
    participant.destroy
    flash[:success] = "Participant was succesfully deleted."
    redirect_to arrangement_path(arrangement)
  end 
end
