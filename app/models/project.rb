class Project < ActiveRecord::Base
  has_many :sprints
  validates :name, presence: true
end
