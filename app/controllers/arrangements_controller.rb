class ArrangementsController < ApplicationController
  def show
    @arrangement = Arrangement.find params[:id]
    @done = @arrangement.done?
    @participants = @arrangement.participants
    @participant = Participant.new

    if @done
      @transfers = @arrangement.settle_debt.sort_by { |t| [t.from.name, t.to.name] }
      render "done"
    else
      render "show"
    end 
  end

  def create
    arrangement = Arrangement.create :name => params[:name], :email => params[:email]
    redirect_to arrangement_path(arrangement)
  end

  def update
    arrangement = Arrangement.find params[:id]
    if arrangement.update_attributes(params[:arrangement])
      respond_to do |format|
        format.html { redirect_to arrangement_path(arrangement) }
        format.json { render :json => arrangement }
      end 
    else
      errors = participant.errors
      flash[:error] = errors.empty? ? "Error" : errors.full_messages.to_sentence

      respond_to do |format|
        format.html { redirect_to arrangement_path(arrangement) }
        format.json { render :nothing => true }
      end 
    end
  end 
end
