class TimeTable < ActiveRecord::Base

  validates :count, presence: true,
            length: { maximum: 1 },
            numericality: {only_integer: true}

  belongs_to :user
  belongs_to :task

  # scope :project, ->(project_id){
  #   where('project_id = ?',project_id)
  # }

  scope :select_task, ->(task_id){
    where('task_id = ?', task_id)
  }

end
