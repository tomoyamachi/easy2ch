class Comment < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true

  default_scope :order => 'created_at DESC'

  paginates_per 100

end
