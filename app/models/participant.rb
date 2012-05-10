class Participant < ActiveRecord::Base
  belongs_to :arrangement, :primary_key => 'uuid', :foreign_key => 'arrangement_uuid'
  belongs_to :user
  has_many :expenses

  validates :user_id, :presence => true
  validates :arrangement_uuid, :presence => true

  delegate :name, :to => :user

  def total_expenses
    expenses.inject(0) { |sum,e| sum + e.amount }
  end

  def debt
    average_expenses = arrangement.average_expenses 
    if total_expenses > average_expenses
      0
    else
      average_expenses - total_expenses
    end 
  end

  def in_debt?
    debt > 0
  end 

  def claim
    average_expenses = arrangement.average_expenses 
    if total_expenses < average_expenses
      0
    else
      total_expenses - average_expenses
    end 
  end

  def has_claim?
    claim > 0
  end 
end
