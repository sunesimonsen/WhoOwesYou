class Arrangement < ActiveRecord::Base
  set_primary_key :uuid

  has_many :participants, :primary_key => 'uuid',
    :foreign_key => 'arrangement_uuid', :dependent => :delete_all

  validates :name, :presence => true

  before_create :generate_uuid

  def generate_uuid
    self.uuid = UUID.new.generate
  end

  def total_expenses
    participants.inject(0) { |sum, p| p.total_expenses + sum }
  end 

  def average_expenses
    count = participants.count 
    if count > 0
      total_expenses / participants.count.to_d
    else
      0
    end 
  end 

  def debitors
    participants.find_all { |p| p.in_debt? }
  end 
    
  def creditors
    participants.find_all { |p| p.has_claim? }
  end 

  def settle_debt
    []
  end
end
