class Participant < ActiveRecord::Base
  belongs_to :arrangement, :primary_key => 'uuid', :foreign_key => 'arrangement_uuid'
  belongs_to :user

  validates :user_id, :presence => true
  validates :arrangement_uuid, :presence => true

  def name
    user.name
  end
end
