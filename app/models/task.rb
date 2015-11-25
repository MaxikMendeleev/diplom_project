class Task < ActiveRecord::Base

  validates :project_id, presence: true
  belongs_to :project
  validates :name, presence: true, length: { maximum: 70 }

  default_scope -> { order('name ASC') }
  
end
