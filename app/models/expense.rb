class Expense < ActiveRecord::Base
  belongs_to :participant
  validates :name, :presence => true
  validates :amount, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0}
  validates :participant_id, :presence => true
end
