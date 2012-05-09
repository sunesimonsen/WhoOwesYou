class Participant < ActiveRecord::Base
  belongs_to :arrangement, :primary_key => 'uuid', :foreign_key => 'arrangement_uuid'
  belongs_to :user
  has_many :expenses

  validates :user_id, :presence => true
  validates :arrangement_uuid, :presence => true

  def name
    user.name
  end

  def total_amount
    expenses.inject(0) { |sum,e| sum + e.amount }
  end
end
