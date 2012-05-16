class ExpensesController < ApplicationController
  def destroy
    arrangement = Arrangement.find(params[:arrangement_id])
    participant = arrangement.participants.find(params[:participant_id])
    expense = participant.expenses.find(params[:id])
    expense.destroy

    flash[:success] = "Expense was succesfully deleted."
    redirect_to arrangement_participant_path(arrangement, participant)
  end

  def create
    arrangement = Arrangement.find(params[:arrangement_id])
    participant = arrangement.participants.find(params[:participant_id])
    expense = participant.expenses.build(params[:expense])
    if expense.save
      flash[:success] = "Expense was succesfully created."
    else 
      errors = expense.errors
      flash[:error] = errors.empty? ? "Error" : errors.full_messages.to_sentence
    end
    redirect_to arrangement_participant_path(arrangement, participant)
  end 
end
