class ExpensesController < ApplicationController
  def destroy
    arrangement = Arrangement.find(params[:arrangement_id])
    participant = arrangement.participants.find(params[:participant_id])
    expense = participant.expenses.find(params[:id])
    expense.destroy

    redirect_to arrangement_participant_path(arrangement, participant)
  end

end
