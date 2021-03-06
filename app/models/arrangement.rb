require 'set'

class Arrangement < ActiveRecord::Base
  set_primary_key :uuid

  has_many :participants, :primary_key => 'uuid',
    :foreign_key => 'arrangement_uuid', :dependent => :delete_all

  validates :name, :presence => true
  validates :email, :presence => true

  before_create :generate_uuid

  def generate_uuid
    self.uuid = UUID.new.generate
  end

  def total_expenses
    participants.map(&:total_expenses).inject(0,&:+)
  end 

  def average_expenses
    count = participants.count 
    return 0 if count <= 0
    total_expenses / count.to_f
  end 

  def debitors
    participants_in_debt = participants.find_all &:in_debt?
    participants_in_debt.map { |p| Debitor.new(p) }
  end 
    
  def creditors
    participants_with_claim = participants.find_all &:has_claim?
    participants_with_claim.map { |p| Creditor.new(p) }
  end 

  def settle_debt
    transfers = Transfers.new
    debitors_with_debt = debitors
    creditors.each do |creditor|
      while creditor.has_claim?
        debitor = debitors_with_debt.pop
        transfer = creditor.collect_debt debitor
        transfers << transfer
      end 

      if debitor.in_debt?
        debitors_with_debt << debitor
      end 
    end
    transfers
  end
end
