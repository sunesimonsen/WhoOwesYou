require 'set'

class Transfers < Set
  def amount
    map(&:amount).inject(0,&:+)
  end
    
  def from participant
    participant_transfers = find_all { |t| t.from == participant } 
    Transfers.new participant_transfers
  end

  def to participant
    participant_transfers = find_all { |t| t.to == participant } 
    Transfers.new participant_transfers
  end
end 
