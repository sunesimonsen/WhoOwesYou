class Debitor
  attr_reader :participant
  attr_accessor :debt
  delegate :name, :to => :participant

  def initialize participant
    @participant = participant
    @debt = participant.debt
  end

  def in_debt?
    @debt > 0
  end
end 
