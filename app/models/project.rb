class Project < ActiveRecord::Base

  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :users

  validates :name, presence: true, length: { maximum: 50 }
  amoeba do
    include_field [:users]
  end
end
