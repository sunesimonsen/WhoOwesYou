class Creditor
  attr_accessor :claim
  delegate :name, :to => :@participant

  def initialize participant
    @participant = participant
    @claim = participant.claim
  end

  def has_claim?
    @claim > 0
  end 

  def collect_debt debitor
    transfer_amount = (debitor.debt - claim) > -1 ? claim : debitor.debt

    @claim -= transfer_amount

    debitor.debt -= transfer_amount
    Transfer.new from: debitor.participant,
                 to: @participant,
                 amount: transfer_amount 
  end 
end 
