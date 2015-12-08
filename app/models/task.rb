class Task < ActiveRecord::Base

  validates :project_id, presence: true

  belongs_to :project
  belongs_to :type_of_problem
  belongs_to :status_complete
  has_many :time_tables

  validates :name, presence: true,
            length: { maximum: 70 }

  has_and_belongs_to_many :users

  default_scope -> { order('name ASC') }
  
end
