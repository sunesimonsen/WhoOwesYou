require 'set'

class Transfers < Set
  def amount
    map { |t| t.amount }.inject(&:+)
  end
    
  def from participant
    participant_transfers = find_all do |t|
      t.from == participant
    end 
    Transfers.new participant_transfers
  end

  def to participant
    participant_transfers = find_all do |t|
      t.to == participant
    end 
    Transfers.new participant_transfers
  end
end 
