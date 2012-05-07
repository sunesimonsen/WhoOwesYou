class Participant < ActiveRecord::Base
  belongs_to :arrangement
  belongs_to :user

  validates :user_id, :presence => true
  validates :arrangement_id, :presence => true

  def name
    user.name
  end
end
