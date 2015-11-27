class Task < ActiveRecord::Base

  validates :project_id, presence: true
  belongs_to :project
  validates :name, presence: true, length: { maximum: 70 }
  validates :complete, presence: true, length: { maximum: 3 }, format: { with: /\A[+-]?\d+\z/}


  default_scope -> { order('name ASC') }
  
end
