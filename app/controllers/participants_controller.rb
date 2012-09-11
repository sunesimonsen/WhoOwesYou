class ParticipantsController < ApplicationController
  def show
    @arrangement = Arrangement.find(params[:arrangement_id])
    @done = @arrangement.done?
    @participant = @arrangement.participants.find(params[:id])
    @expense = Expense.new

    if @done
      render "done"
    else
      render "show"
    end 
  end

  def create
    arrangement = Arrangement.find(params[:arrangement_id])
    participant = arrangement.participants.build(params[:participant]);
    if participant.save
      redirect_to arrangement_participant_path(arrangement, participant)
    else 
      errors = participant.errors
      flash[:error] = errors.empty? ? "Error" : errors.full_messages.to_sentence
      redirect_to arrangement_path(arrangement)
    end
  end

  def destroy
    arrangement = Arrangement.find(params[:arrangement_id])
    participant = arrangement.participants.find(params[:id])
    participant.destroy
    redirect_to arrangement_path(arrangement)
  end 
end
