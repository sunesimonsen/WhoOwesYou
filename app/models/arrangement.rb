class Arrangement < ActiveRecord::Base
  set_primary_key :uuid

  has_many :participants, :primary_key => 'uuid', :foreign_key => 'arrangement_uuid'

  validates :name, :presence => true

  before_create :generate_uuid

  def generate_uuid
    self.uuid = UUID.new.generate
  end
    
end
